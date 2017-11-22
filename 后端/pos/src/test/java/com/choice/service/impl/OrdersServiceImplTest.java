package com.choice.service.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.choice.common.ServerResponse;
import com.choice.dto.OrdersDTO;
import com.choice.entity.OrderItem;
import com.choice.mapper.OrdersMapper;
import com.choice.service.OrderItemService;
import com.choice.service.OrdersService;
import com.choice.util.JsonUtils;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/applicationContext-*.xml"})
public class OrdersServiceImplTest {
	@Resource
	private OrdersMapper ordersMapper;
	@Resource
	private OrdersService ordersService;
	@Resource
	private OrderItemService orderItemService;
	@Test
	public void testAddOrders() {
		/*OrderItem item1=new OrderItem(null, null, "1", "1", "1");
		OrderItem item2=new OrderItem(null, null, "2", "1", "1");
		OrderItem item3=new OrderItem(null, null, "3", "1", "1");
		List<OrderItem> items=new ArrayList<OrderItem>();
		items.add(item1);
		items.add(item2);
		items.add(item3);
		OrdersDTO dto=new OrdersDTO(null, null, null, null, "1", "143", "3", items);
		ServerResponse<OrdersDTO> result = ordersService.addOrders(dto);
		String json = JsonUtils.objectToJson(result);
		System.out.println(json);*/
		Map<String, String> map = ordersMapper.selectToItem("33");
		System.out.println(map);
	}

	@Test
	public void testQueryOrders() {
		/*ServerResponse<List<OrderItem>> list = orderItemService.queryOrderItemByOrdersId("2");
		System.out.println(JsonUtils.objectToJson(list));*/
	}

}
