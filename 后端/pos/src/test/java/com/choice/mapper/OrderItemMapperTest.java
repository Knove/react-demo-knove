package com.choice.mapper;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.choice.entity.OrderItem;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/applicationContext-*.xml"})
public class OrderItemMapperTest {
	@Resource
	private OrderItemMapper orderItemMapper;
	@Test
	public void testSave() {
		OrderItem orderItem = new OrderItem();
		orderItem.setdId("1");
		orderItem.setOiCount("1");
		
		orderItem.setOiStatus("1");
		orderItem.setoId("1");
	
	}

	@Test
	public void testSelectByOid() {
		List<OrderItem> list = orderItemMapper.selectByOid("1");
		System.out.println(list);
	}
	

}
