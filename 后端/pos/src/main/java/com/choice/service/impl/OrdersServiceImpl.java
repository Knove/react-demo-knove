package com.choice.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choice.common.Const;
import com.choice.common.ServerResponse;
import com.choice.dto.OrdersDTO;
import com.choice.entity.Desk;
import com.choice.entity.Dish;
import com.choice.entity.OrderItem;
import com.choice.entity.Orders;
import com.choice.filter.WSHandler;
import com.choice.mapper.DeskMapper;
import com.choice.mapper.DishMapper;
import com.choice.mapper.JedisClient;
import com.choice.mapper.OrderItemMapper;
import com.choice.mapper.OrdersMapper;
import com.choice.service.DishService;
import com.choice.service.MQService;
import com.choice.service.OrderItemService;
import com.choice.service.OrdersService;
import com.choice.util.DateTimeUtil;
import com.choice.util.IDUtils;
import com.choice.util.JsonUtils;
import com.choice.vo.OrdersPage;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class OrdersServiceImpl implements OrdersService {
	private static final Logger log = Logger.getLogger(OrdersServiceImpl.class);
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private ThreadPoolTaskExecutor taskExecutor;
	@Autowired
	@Qualifier("MQService")
	private MQService mQService;
	@Autowired
	@Qualifier("SetCountMQService")
	private MQService mQService2;
	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private DeskMapper deskMapper;
	@Autowired
	private OrderItemMapper orderItemMapper;
	@Autowired
	private WSHandler wsHandler;
	@Autowired
	private DishService dishService;
	@Autowired
	private DishMapper dishMapper;
	@Autowired
	private JedisClient jedisClient;
	/***
	 * 增加订单
	 * 1.查询桌子是否被占用
	 * 2.查询库存中菜品是否足够
	 * 3.若足够将菜品库存余量更新
	 * 4.插入订单表
	 * 5.插入订单明细表
	 * 6.更改桌子状态为已使用
	 * 7.打印日志
	 * 8.通过websocket向前端发送桌子被占用的消息
	 * 9.异步向mq发送订单消息
	 * 10.将dto信息补全返回
	 */

	@Transactional
    public ServerResponse<OrdersDTO> addOrders(String data) throws Exception{
		//将json数据转换为orderdto
		OrdersDTO ordersDTO = JsonUtils.jsonToPojo(data, OrdersDTO.class);
		//查询桌子是否被占用
		Desk desk = deskMapper.selectDeskById(ordersDTO.getDeId());
		if(desk.getDeStatus().equals("1")){
			return ServerResponse.createByErrorMessage("1");
		}
		//查询菜品是否足够
		List<Dish> dishList = qualifyDishCount(ordersDTO);
		//若不够则返回error
		if(dishList != null && dishList.size()>0){
			return ServerResponse.createByErrorMessage(JsonUtils.objectToJson(dishList));
		}
		//更新菜品数量
		updateDishCount(ordersDTO);
		//插入订单表
		Orders orders = insertOrders(ordersDTO);
		//获取订单明细，插入订单明细表
		List<OrderItem> orderItemList = ordersDTO.getOrderItemList();
		orderItemList = insertOrderItem(orderItemList,orders);
		//根据桌子号将桌子改为已使用状态
		deskMapper.updateDeskStatusByNum(ordersDTO.getDeId(), "1");
		//将orderdto补全
		ordersDTO.setId(orders.getId());
		ordersDTO.setoDate(orders.getoDate());
		ordersDTO.setoNum(orders.getoNum());
		ordersDTO.setoStatus("已下单");
		ordersDTO.setOrderItemList(orderItemList);
        log.debug("订单生成:" + ordersDTO);
        //通知前端
        String msg = "{\"type\":\"desk\",\"status\":\"1\",\"data\":\""+ordersDTO.getDeId()+"\"}";
		wsHandler.sendMessage(msg);
        //异步向mq发送订单消息
        printOrder(ordersDTO);
        //封装为响应对象返回
        ServerResponse<OrdersDTO> result = ServerResponse.createBySuccess(ordersDTO);
		return result;
    }
	
	/***
	 * 查询全部订单
	 */
    public ServerResponse<PageInfo<Orders>> queryOrders(Integer pageNum, Integer pageSize) {
    	try {
			PageHelper.startPage(pageNum, pageSize);
			List<Orders> orderList = ordersMapper.selectAll();
			PageInfo<Orders> pageInfo = new PageInfo<Orders>(orderList);
			ServerResponse<PageInfo<Orders>> result = ServerResponse.createBySuccess(pageInfo);
			return result;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ServerResponse.createByError();
		}
    }

	/**
	 * 统计订单总数
	 */
	public ServerResponse<String> queryOrdersCount() throws Exception{
		String OrdersCount=ordersMapper.selectOrdesCount();
		return ServerResponse.createBySuccess(OrdersCount);

	}
	/**
	 * 统计营业额
	 */
	public ServerResponse<String> querySumTotal()throws Exception {

		String SumTotal=ordersMapper.selectOrdersToatal();
		return ServerResponse.createBySuccess(SumTotal);
	}
	/**
	 * 结账功能
	 */
	@Transactional
	public ServerResponse settleAccount(String id,String deNum) throws Exception{
		//根据订单的id 查询订单详情
		List<OrderItem> items=orderItemMapper.selectByOid(id);
		//遍历订单详情  如果未上菜 在库存中添加相应库存数量
		for (OrderItem orderItem : items) {
			//如果未上菜，修改菜的库存数量
			if(orderItem.getOiStatus().equals("0")){
				/*根据菜品的id获取菜品的库存*/
				Dish dish=dishMapper.selectDishByIdCount(orderItem.getdId());
				Integer a=Integer.parseInt(dish.getdCount());
				/*更新库存*/
				dish.setId(Integer.parseInt(orderItem.getdId()));
				dish.setdCount(String.valueOf(a+Integer.parseInt(orderItem.getOiCount())));
				dishMapper.updateDish(dish);
				jedisClient.expire(Const.DISH_CACHE, 0);
			}
			
		}
		//释放桌子
		Integer stb=deskMapper.updateDeskStatusByNum(deNum, "0");
		//修改付款状态
		Integer sta=ordersMapper.updateOrdersStatus(id);
		
		printCount(deNum+"号桌顾客结账！");
		String msg = "{\"type\":\"desk\",\"status\":\"2\",\"data\":\""+deNum+"\"}";
		wsHandler.sendMessage(msg);
		return ServerResponse.createBySuccess();
	}

	/**
	 * 异步向mq发送消息
	 * @param dish
	 */
	public void printCount(String str){
		//从线程池中取出一个线程向mq发送订单消息
		taskExecutor.execute(new Runnable() {
			@Override
			public void run() {
				mQService2.sendMessage(str);
			}
		});
	}

	/**
	 * 订单的模糊查询
	 */
		@Override
		public ServerResponse<List<Orders>> queryOrdersByNumAndDate(String oNum, String sDate, String eDate) throws Exception{
			// TODO Auto-generated method stub
				//前端未选择查询条件时  为全部查询 
				if("undefined".equals(oNum)){
					oNum=null;
				}
				if("undefined".equals(sDate)||"undefined".equals(eDate)
						||StringUtils.isBlank(sDate)||StringUtils.isBlank(eDate)){
					sDate=null;
					eDate=null;
				}
				if(sDate!=null){
					sDate = sDate + " 00:00:00";
					eDate = eDate + " 23:59:59";
				}
				List<Orders> orders=ordersMapper.selectAllSearch(oNum, sDate, eDate);
				List<Orders> orders1=setdeNumToOrders(orders);
				List<Orders> orders2=setOrdersStatus(orders1);
				return ServerResponse.createBySuccess(orders2);
		}
		//订单的模糊查询---分页查询
		@Override
		public ServerResponse<OrdersPage> queryOrdersBySearch(String oNum,
				String sDate, String eDate, Integer pageNum) {
			if("undefined".equals(oNum)){
				oNum=null;
			}
			if("undefined".equals(sDate)||"undefined".equals(eDate)
					||StringUtils.isBlank(sDate)||StringUtils.isBlank(eDate)){
				sDate=null;
				eDate=null;
			}
			if(sDate!=null){
				sDate = sDate + " 00:00:00";
				eDate = eDate + " 23:59:59";
			}
			//总金额
			List<Orders> orders5=ordersMapper.selectAllSearch(oNum, sDate, eDate);
			Integer ototal=0;
			for (Orders orders3 : orders5) {
			ototal+=Integer.parseInt(orders3.getoTotal());
			}
				PageHelper.startPage(pageNum, Const.ORDERS_NUM);
				List<Orders> orders=ordersMapper.selectAllSearch(oNum, sDate, eDate);
				List<Orders> orders1=setdeNumToOrders(orders);
				List<Orders> orders2=setOrdersStatus(orders1);
				PageInfo<Orders> pageInfo = new PageInfo<Orders>(orders2);
				OrdersPage ordersPage=
						new OrdersPage(String.valueOf(pageInfo.getTotal()), String.valueOf(ototal), pageInfo.getPageSize(), pageInfo.getPageNum(), pageInfo.getList());
				return ServerResponse.createBySuccess(ordersPage);
		}
			/**
			 * //查询相应的桌号  封装到订单 
			 * @param orders
			 * @return orders
			 */
			public List<Orders>  setdeNumToOrders(List<Orders> orders){
				List<Desk> desks=deskMapper.selectAllDesk();
				Map<String, String> map=new HashMap<String, String>();
				for (Desk desk : desks) {
					map.put(desk.getId().toString(), desk.getDeNum());
				}
				for (Orders orders2 : orders) {
					orders2.setDeId(map.get(orders2.getDeId()));
				}
				return orders;
			}
			/**
			 * 将付款的状态转化为字符串  封装到订单  
			 * @param orders
			 * @return orders
			 */
			public List<Orders> setOrdersStatus(List<Orders> orders){
				for (Orders orders2 : orders) {
					switch(orders2.getoStatus()){
					 case "0":orders2.setoStatus("已下单 ");break;
					 case "1":orders2.setoStatus("代付款 ");break;
					 case "2":orders2.setoStatus("已结账 ");break;
					 default :break;
					}
				}
				return orders;
			}
	/**
	 * 从订单中获取订单号，桌号，总金额，下单时间
	 */
	@Override
	public Map<String, String> selectToItem(String id) throws Exception{
		Map<String, String> map = ordersMapper.selectToItem(id);
		return map;
	}
	/***
	 * 插入订单表
	 * @param ordersDTO
	 * @return
	 * @throws Exception
	 */
	
	public Orders insertOrders(OrdersDTO ordersDTO) throws Exception{
		//将订单表补全
		String num = IDUtils.genItemId() + "";
		String date = DateTimeUtil.dateToStr(new Date());
		Orders orders = new Orders(null, num, date, "0",
				ordersDTO.getDeId(),ordersDTO.getoTotal(), ordersDTO.getOdCount());
		//保存订单
		Integer flag = ordersMapper.save(orders);
		if(flag != 0){
			return orders;
		}
		throw new Exception();
	}
	/***
	 * 插入订单明细表
	 * @param ordersDTO
	 */
	public List<OrderItem> insertOrderItem(List<OrderItem> orderItemList,Orders orders) throws Exception{
		//将订单明细表补全
		for (OrderItem orderItem : orderItemList) {
			orderItem.setoId(orders.getId()+"");
			orderItem.setOiStatus("0");
		}
		//插入订单明细表
		Integer flag = orderItemMapper.save(orderItemList);
		if(flag != 0){
			return orderItemList;
		}
		throw new Exception();
	
	}
	/***
	 * 异步向mq发送消息
	 * @param ordersDTO
	 */
	public void printOrder(OrdersDTO ordersDTO){
		//从线程池中取出一个线程向mq发送订单消息
		taskExecutor.execute(new Runnable() {
			@Override
			public void run() {
				mQService.sendMessage(JsonUtils.objectToJson(ordersDTO));
			}
		});
	}

 	/***
	 * 通过桌子id查询订单
	 * @param deId
	 */
	@Override
	public ServerResponse<OrdersDTO> selectOrdersByDeid(String deId) throws Exception{
		// TODO Auto-generated method stub
		//根据桌子id查询订单表
		Orders orders = ordersMapper.selectOrdersByDeid(deId);
		//根据订单id查询订单明细
		ServerResponse<OrdersDTO> result = orderItemService.queryOrderItemByOrdersId(orders.getId().toString());
		return result;
	}
	/***
	 * 查询菜品是否足够
	 * @param ordersDTO
	 * @return List<Dish>
	 * @throws Exception 
	 */
	public List<Dish> qualifyDishCount(OrdersDTO ordersDTO) throws Exception{
		Map<String, String> countmap = new HashMap<String, String>();
		Map<String, String> namemap = new HashMap<String, String>();
		List<Dish> list = new ArrayList<Dish>();
		//查询全部菜品
		List<Dish> dishList = orderItemService.queryAllDish();
		//将菜品id，菜品数量封装进map
		for (Dish dish : dishList) {
			countmap.put(dish.getId()+"", dish.getdCount());
		}
		//将菜品id，菜品名称封装进map
		for (Dish dish : dishList) {
			namemap.put(dish.getId()+"", dish.getdName());
		}
		//获得菜品详情list
		List<OrderItem> orderItemList = ordersDTO.getOrderItemList();
		for (OrderItem orderItem : orderItemList) {
			//若菜品详情中菜品数量大于菜品总数将名称和总数封装为dish添加到dishlist中
			if(Integer.parseInt(countmap.get(orderItem.getdId()))
					- Integer.parseInt(orderItem.getOiCount())<0){
				Dish temp = new Dish();
				temp.setdName(namemap.get(orderItem.getdId()));
				temp.setdCount(countmap.get(orderItem.getdId()));
				list.add(temp);
			}
		}
		return list;
	}
	/***
	 * 更新菜品数量
	 * @param ordersDTO
	 * @return List<Dish>
	 * @throws Exception 
	 */
	@Transactional
	public void updateDishCount(OrdersDTO ordersDTO) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		//获取订单详情list
		List<OrderItem> dishList = ordersDTO.getOrderItemList();
		//查询所有菜品
		List<Dish> allDishList = orderItemService.queryAllDish();
		//将菜品id，菜品数量封装进map
		for (Dish dish : allDishList) {
			map.put(dish.getId()+"", dish.getdCount());
		}
		for (OrderItem orderItem : dishList) {
			//新建用于更新的对象
			Dish dish = new Dish();
			dish.setId(Integer.parseInt(orderItem.getdId()));
			//计算剩余菜品数量
			int num = Integer.parseInt(map.get(orderItem.getdId())) - Integer.parseInt(orderItem.getOiCount());
			dish.setdCount(num+"");
			//更新菜品数量
			dishMapper.updateDish(dish);
			//缓存失效
			jedisClient.expire(Const.DISH_CACHE, 0);
		}
	}

}
