package com.choice.service;

import com.choice.common.ServerResponse;
import com.choice.dto.OrdersDTO;
import com.choice.entity.Dish;
import com.choice.entity.Orders;
import com.choice.vo.OrdersPage;
import com.github.pagehelper.PageInfo;
import com.mysql.fabric.Server;

import java.util.List;
import java.util.Map;

public interface OrdersService {
    //新增订单
    ServerResponse<OrdersDTO> addOrders(String data) throws Exception;
    //查询订单(分页)
    ServerResponse<PageInfo<Orders>> queryOrders(Integer pageNum,Integer pageSize);
    //根据订单编号和下单时间查询订单（若条件为空不参与查询）
    ServerResponse<List<Orders>> queryOrdersByNumAndDate(String oNum,String sDate,String eDate) throws Exception;
  //根据订单编号和下单时间查询订单（若条件为空不参与查询,实现分页）
    ServerResponse<OrdersPage> queryOrdersBySearch(String oNum,String sDate,String eDate,Integer pageNum);
    //查询订单数量
    ServerResponse<String> queryOrdersCount() throws Exception;
    //查询总营业额
    ServerResponse<String> querySumTotal() throws Exception;
    //根据订单id结账
    ServerResponse settleAccount(String id,String deNum) throws Exception;
    //查询订单详情加入订单明细
    Map<String, String> selectToItem(String id) throws Exception;
    //通过桌子id查询订单
    ServerResponse<OrdersDTO> selectOrdersByDeid(String deId) throws Exception;
}
