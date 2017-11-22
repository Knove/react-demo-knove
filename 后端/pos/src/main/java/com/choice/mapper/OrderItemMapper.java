package com.choice.mapper;

import java.util.List;

import com.choice.entity.OrderItem;

public interface OrderItemMapper {
	//保存订单明细
	Integer save(List<OrderItem> orderItem);
	//通过订单id查询订单明细
	List<OrderItem> selectByOid(String id);
	//点击上菜，修改改订单下的菜的上菜状态
	Integer updateDishStatus(String id);
	//根据订单详情的ID查询该订单详情
	OrderItem selectOrderItemByOrderInemId(String orderItemId);

}
