package com.choice.service.impl;

import com.choice.common.Const;
import com.choice.common.ServerResponse;
import com.choice.dto.OrdersDTO;
import com.choice.entity.Dish;
import com.choice.entity.DishCatelog;
import com.choice.filter.WSHandler;
import com.choice.mapper.DishCatelogMapper;
import com.choice.mapper.DishMapper;
import com.choice.mapper.JedisClient;
import com.choice.service.DishService;
import com.choice.service.MQService;
import com.choice.util.DateTimeUtil;
import com.choice.util.JsonUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.common.base.Strings;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

@Service
public class DishServiceImpl implements DishService {
	private Logger logger = Logger.getLogger(DishServiceImpl.class);

	@Autowired
	private WSHandler wsHandler;
	@Autowired
	private DishMapper dishMapper;
	@Autowired
	private DishCatelogMapper dishCatelogMapper;
	@Autowired
	private ThreadPoolTaskExecutor taskExecutor;
	@Autowired
	@Qualifier("DishMQService")
	private MQService mQService;
	@Autowired
	private JedisClient jedisClient;
	/**
	 * 根据菜品种类id查询菜品
	 * @param catelog
	 * @return
	 * @throws Exception
	 */
	public ServerResponse<List<Dish>> queryDishByCatelog(String catelog) throws Exception{

		String json = jedisClient.hget(Const.DISH_CACHE, catelog);
		if(!StringUtils.isBlank(json)) {
			jedisClient.expire(Const.DISH_CACHE, 1000);
			List<Dish> dishList = JsonUtils.jsonToList(json, Dish.class);
			return ServerResponse.createBySuccess(dishList);
		}
		List<Dish> dishList = dishMapper.selectDishByCatelog(catelog);
		List<DishCatelog> dishCatelogList = dishCatelogMapper.selectList();
		Map<String,String> map = new HashMap();
		for(DishCatelog dishCatelog : dishCatelogList){
			map.put(dishCatelog.getId().toString(),dishCatelog.getDcName());
		}
		for(Dish dish : dishList){
			dish.setDcId(map.get(dish.getDcId()));
		}
		json = JsonUtils.objectToJson(dishList);
		jedisClient.hset(Const.DISH_CACHE, catelog, json);
		jedisClient.expire(Const.DISH_CACHE, 1000);
		return ServerResponse.createBySuccess(dishList);
	}

	/**
	 * 新增菜品
	 * @param dish
	 * @return
	 * @throws Exception
	 */
	public ServerResponse addDish(Dish dish) throws Exception{

		DishUndefinedToNull(dish);
		String date = DateTimeUtil.dateToStr(new Date(),"yyyy-MM-dd HH:mm:ss");
		dish.setdDate(date);
		Integer result = dishMapper.insertDish(dish);
		if(result.equals(1)){
			jedisClient.expire(Const.DISH_CACHE, 0);
			logger.info("新增菜品"+dish.toString());
			printDish(dish);
			String msg = "{\"type\":\"dish\",\"status\":\"1\",\"data\":\""+dish.getdName()+"\"}";
			wsHandler.sendMessage(msg);
			return ServerResponse.createBySuccess();
		}else {
			return ServerResponse.createByError();
		}
	}


	/**
	 * 异步向mq发送消息
	 * @param dish
	 */
	public void printDish(Dish dish){
		//从线程池中取出一个线程向mq发送订单消息
		taskExecutor.execute(new Runnable() {
			@Override
			public void run() {
				mQService.sendMessage(JsonUtils.objectToJson(dish));
			}
		});
	}

	/**
	 * 更新菜品
	 * @param dish
	 * @return
	 * @throws Exception
	 */
	public ServerResponse updateDish(Dish dish) throws Exception{

		DishUndefinedToNull(dish);
		Integer result = dishMapper.updateDish(dish);
		if(result.equals(1)){
			jedisClient.expire(Const.DISH_CACHE, 0);
			logger.info("修改菜品"+dish.toString());
			dish = dishMapper.selectDishById(dish.getId());
			String msg = "{\"type\":\"dish\",\"status\":\"2\",\"data\":\""+dish.getdName()+"\"}";
			wsHandler.sendMessage(msg);
			return ServerResponse.createBySuccess();
		}else {
			return ServerResponse.createByError();
		}
	}

	/**
	 * 删除菜品
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public ServerResponse deleteDish(Integer id) throws Exception{
		Dish dish = dishMapper.selectDishById(id);
		Integer result = dishMapper.deleteDishById(id);
		if(result.equals(1)){
			jedisClient.expire(Const.DISH_CACHE, 0);
			logger.info("删除菜品"+id);
			String msg = "{\"type\":\"dish\",\"status\":\"3\",\"data\":\""+dish.getdName()+"\"}";
			wsHandler.sendMessage(msg);
			return ServerResponse.createBySuccess();
		}else {
			return ServerResponse.createByError();
		}
	}

	/**
	 * 根据菜品汉拼首字母模糊查询菜品
	 * @param cn
	 * @return
	 * @throws Exception
	 */
	public ServerResponse<List<Dish>> queryDishByCn(String cn) throws Exception{
		List<Dish> dishList = dishMapper.selectDishByCn(cn);
		dishCatelogIdToName(dishList);
		return ServerResponse.createBySuccess(dishList);
	}

	/**
	 * 根据菜品名称和上架日期查询菜品
	 * @param dName
	 * @param sdDate
	 * @param edDate
	 * @return
	 * @throws Exception
	 */
	public ServerResponse<List<Dish>> queryDishByNameAndDate(String dName, String sdDate, String edDate) throws Exception{

		if(Strings.isNullOrEmpty(sdDate) || Strings.isNullOrEmpty(edDate)||
				sdDate.equals("undefined") || edDate.equals("undefined")) {
			sdDate = null;
			edDate = null;
		}
		List<Dish> dishList = getDishList(dName, sdDate, edDate);
		return ServerResponse.createBySuccess(dishList);

	}

	/**
	 * 先从缓存获取全部的菜
	 * 若缓存没有，从数据库获取，再放到缓存
	 * 对日期数据特殊处理
	 * @param dName
	 * @param sdDate
	 * @param edDate
	 * @return
	 */
	public List<Dish> getDishList(String dName, String sdDate, String edDate){
		List<Dish> dishList  = null;
		if(Strings.isNullOrEmpty(dName)&&Strings.isNullOrEmpty(sdDate)&&Strings.isNullOrEmpty(edDate)){
			String cacheDishList = jedisClient.hget(Const.DISH_CACHE,"alldish");
			if(Strings.isNullOrEmpty(cacheDishList)){
				dishList = dishMapper.selectDishByDNameAndDDate(dName, sdDate,edDate);
				dishCatelogIdToName(dishList);
				cacheDishList = JsonUtils.objectToJson(dishList);
				jedisClient.hset(Const.DISH_CACHE,"alldish",cacheDishList);
				jedisClient.expire(Const.DISH_CACHE, 1000);
			}else{
				dishList = JsonUtils.jsonToList(cacheDishList,Dish.class);
				jedisClient.expire(Const.DISH_CACHE, 1000);
			}
		}
		else {
			if(sdDate != null){
				sdDate = sdDate+" 00:00:00";
				edDate = edDate+" 23:59:59";
			}
			dishList = dishMapper.selectDishByDNameAndDDate(dName, sdDate,edDate);
			dishCatelogIdToName(dishList);
		}
		return dishList;
	}

	/**
	 * 把菜品类别id替换为菜品类别名称
	 * @param dishList
	 */
	public void dishCatelogIdToName(List<Dish> dishList) {
		List<DishCatelog> dishCatelogList = dishCatelogMapper.selectList();
		Map<String,String> map = new HashMap();
		for(DishCatelog dishCatelog : dishCatelogList){
			map.put(dishCatelog.getId().toString(),dishCatelog.getDcName());
		}
		for(Dish dish : dishList){
			dish.setDcId(map.get(dish.getDcId()));
		}
	}


	/**
	 * 把"undefined"和"null"替换为null
	 * @param dish
	 */
	public void DishUndefinedToNull(Dish dish){

		if(dish.getDcId()!=null&&(dish.getDcId().equals("undefined")||dish.getDcId().equals("null"))){
			dish.setDcId(null);
		}
		if(dish.getdName()!=null&&(dish.getdName().equals("undefined")||dish.getdName().equals("null"))) {
			dish.setdName(null);
		}
		if(dish.getdCn()!=null&&(dish.getdCn().equals("undefined")||dish.getdCn().equals("null"))) {
			dish.setdCn(null);
		}
		if(dish.getdDate()!=null&&(dish.getdDate().equals("undefined")||dish.getdDate().equals("null"))) {
			dish.setdDate(null);
		}
		if(dish.getdMaterial()!=null&&(dish.getdMaterial().equals("undefined")||dish.getdMaterial().equals("null"))) {
			dish.setdMaterial(null);
		}
		if(dish.getdRemark()!=null&&(dish.getdRemark().equals("undefined")||dish.getdRemark().equals("null"))){
			dish.setdRemark(null);
		}
		if(dish.getdCount()!=null&&(dish.getdCount().equals("undefined")||dish.getdCount().equals("null"))){
			dish.setdCount(null);
		}
		if(dish.getdPrice()!=null&&(dish.getdPrice().equals("undefined")||dish.getdPrice().equals("null"))){
			dish.setdPrice(null);
		}
		if(dish.getdStatus()!=null&&(dish.getdStatus().equals("undefined")||dish.getdStatus().equals("null"))){
			dish.setdStatus(null);
		}
	}

	/**
	 * 查询全部菜品(分页)
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public ServerResponse<PageInfo> queryDish(Integer pageNum, Integer pageSize) throws Exception{
		PageHelper.startPage(pageNum,pageSize);
		List<Dish> dishList = dishMapper.selectDish();
		PageInfo pageInfo = new PageInfo(dishList);
		return ServerResponse.createBySuccess(pageInfo);
	}

	/**
	 * 参数验证
	 * @param result
	 * @return
	 * @throws Exception
	 */
	public ServerResponse judgeAttribute(BindingResult result) throws Exception{
		StringBuffer sb = new StringBuffer();
		List<FieldError> fieldErrorList = result.getFieldErrors();
		for(FieldError fieldError:fieldErrorList) {
			sb.append(fieldError.getField() + ":" + fieldError.getDefaultMessage() + ";");
		}
		return ServerResponse.createByErrorMessage(sb.toString());
	}

	/***
	 * 查询售空菜品列表
	 */
	public ServerResponse<List<Dish>> queryDishWithNone()throws Exception {
		List<Dish> emptyDishList = dishMapper.selectEmptyDish();
		ServerResponse<List<Dish>> result = ServerResponse.createBySuccess(emptyDishList);
		return result;
	}
	/***
	 * 查询售空菜品数量
	 */
	public ServerResponse<String> queryDishCountWithNone() throws Exception{
		Integer count = dishMapper.selectEmptyCount();
		ServerResponse<String> result = ServerResponse.createBySuccess(""+count);
		return result;
	}
	/***
	 * 查询余量不足菜品数量
	 */
	public ServerResponse<String> queryDishCountithNotEnough() throws Exception{
		Integer count = dishMapper.selectNotEnoughCount(Const.DHSI_NUM);
		ServerResponse<String> result = ServerResponse.createBySuccess(""+count);
		return result;
	}
	/***
	 * 查询菜品所有数量
	 */
	public ServerResponse<String> queryDishCount() throws Exception{
		Integer count = dishMapper.selectDishCount();
		ServerResponse<String> result = ServerResponse.createBySuccess(""+count);
		return result;
	}
}

