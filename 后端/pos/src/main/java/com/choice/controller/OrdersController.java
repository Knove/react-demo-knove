package com.choice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choice.common.ServerResponse;
import com.choice.dto.OrdersDTO;
import com.choice.entity.Orders;
import com.choice.service.OrdersService;
import com.choice.vo.OrdersPage;
import com.github.pagehelper.PageInfo;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/orders")
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	
	
	/***
	 * 增加订单
	 * @param response
	 * @param data
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public ServerResponse<OrdersDTO> addOrders(HttpServletResponse response, String data) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		System.out.println("新增订单");
		ServerResponse<OrdersDTO> result = ordersService.addOrders(data);
		return result;
	}
	
	/***
	 * 根据桌号查询订单明细
	 * @param response
	 * @param deId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("deId")
	@ResponseBody
	public ServerResponse<OrdersDTO> selectOrdersByDeid(HttpServletResponse response, String deId) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		ServerResponse<OrdersDTO> result = ordersService.selectOrdersByDeid(deId);
		return result;
	}
	
	/*@RequestMapping("/list")
	@ResponseBody
	public ServerResponse<PageInfo<Orders>> queryOrders(Integer pageNum,Integer pageSize){
		ServerResponse<PageInfo<Orders>> result = ordersService.queryOrders(pageNum, pageSize);
		return result;
	}*/

	//根据订单编号和下单时间查询订单（若条件为空不参与查询）
	@RequestMapping("list")
	@ResponseBody
	public ServerResponse<List<Orders>> queryOrdersByNumAndDate(HttpServletResponse response,String oNum, String sDate, String eDate) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return ordersService.queryOrdersByNumAndDate(oNum, sDate, eDate);
	}
	//根据订单编号和下单时间查询订单（若条件为空不参与查询,分页）
	@RequestMapping("slist")
	@ResponseBody
	public ServerResponse<OrdersPage> queryOrdersBySearch(HttpServletResponse response,String oNum, String sDate, String eDate,Integer pageNum) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return ordersService.queryOrdersBySearch(oNum, sDate, eDate, pageNum);
	}
	//查询订单数量
	@RequestMapping("count")
	@ResponseBody
	public  ServerResponse<String> queryOrdersCount(HttpServletResponse response) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return ordersService.queryOrdersCount();
	}
	//查询总营业额
	@RequestMapping("sumTotal")
	@ResponseBody
	public  ServerResponse<String> querySumTotal(HttpServletResponse response) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return ordersService.querySumTotal();
	}
	//根据订单id结账
	@RequestMapping("settleAccount")
	@ResponseBody
	public  ServerResponse settleAccount(HttpServletResponse response,String id,String deNum) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return ordersService.settleAccount(id,deNum);
	}
}
