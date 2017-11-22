package com.choice.service;

import com.choice.common.ServerResponse;
import com.choice.dto.OrdersDTO;
import com.choice.entity.Dish;
import com.choice.entity.OrderItem;

import java.util.List;

public interface OrderItemService {
    //根据订单id查询订单详细
    ServerResponse<OrdersDTO> queryOrderItemByOrdersId(String ordersId) throws Exception;
    //根据订单详情上菜
    ServerResponse upDish(String ordersItemId) throws Exception;
    //查询全部菜品
    List<Dish> queryAllDish() throws Exception;
}
