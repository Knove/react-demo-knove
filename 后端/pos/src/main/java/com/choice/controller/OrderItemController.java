package com.choice.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choice.common.ServerResponse;
import com.choice.dto.OrdersDTO;
import com.choice.entity.OrderItem;
import com.choice.service.OrderItemService;

@Controller
@RequestMapping("/orderitem")
public class OrderItemController {
	@Autowired
	private OrderItemService orderItemService;
	
	/***
	 * 根据订单id查询订单明细
	 * @param response
	 * @param ordersId
	 * @return
	 */
	@RequestMapping("ordersId")
	@ResponseBody
	public ServerResponse<OrdersDTO> queryOrderItemByOrdersId(HttpServletResponse response,
			String ordersId)throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		ServerResponse<OrdersDTO> result = orderItemService.queryOrderItemByOrdersId(ordersId);
		return result;
	}

	@RequestMapping("updish")
	@ResponseBody
	public ServerResponse upDish(HttpServletResponse response,String ordersItemId) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return orderItemService.upDish(ordersItemId);
	}
	
}
