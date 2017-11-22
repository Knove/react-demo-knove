/**
 * Created by  Knove on 2017/11/10.
 */
//逻辑区域
export const GET_ORDER_SE = 'GET_ORDER_SE';  //获取上菜的成功状况
export const GET_UP_ORDER = 'GET_UP_ORDER'; //获取提交订单的成功状况
export const CLEAR_ORDER_SE = 'CLEAR_ORDER_SE'; //清空储存的订单信息

// 内部区域
export const REQUEST_DATA = 'REQUEST_DATA';
export const RECEIVE_DATA = 'RECEIVE_DATA';
export const REQUEST_ORDER='REQUEST_ORDER';   //获取·订单·列表
export const REQUEST_FOOD='REQUEST_FOOD'; //获取·菜品·列表
export const REQUEST_DESK='REQUEST_DESK';    //获取·桌子·列表
export const POINT_DESK='POINT_DESK';     //指定目前的桌号
export const INIT_ORDER='INIT_ORDER';     //服务员订餐页面的初始化
export const ADD_FOOD='ADD_FOOD';     //增加菜品
export const DELETE_FOOD='DELETE_FOOD';     //删除菜品
export const NUMBER_FOOD='NUMBER_FOOD';    //调整菜品数量
export const PUSH_ORDER='PUSH_ORDER';    //提交订单
export const ORDER_DETAILS='ORDER_DETAILS' //查看订单明细
export const ORDER_DETAILS_ID='ORDER_DETAILS_ID' //根据ID查询订单里的菜品明细
export const ORDER_LIST_PAGENUMBER='ORDER_LIST_PAGENUMBER' //根据页码请求订单list
export const CLEAR_ORDER_STORE='CLEAR_ORDER_STORE' //清除在Store中已经结账的信息


//webSocket 区域
export const WS_ONLINE_NUMBER = 'WS_ONLINE_NUMBER';   //获取当前在线人数


