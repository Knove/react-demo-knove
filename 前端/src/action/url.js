/**
 * Created by  Knove on 2017/11/17.
 */


//请求的远链接
    //部署本机 换为      http://localhost:8080/
    //远程   换为        http://30.87.246.189:8080/
let url="http://30.87.246.189:8080/";

//订单页面的初始化
export const ORDER_INIT = url+'orders/list';
//菜品页面的初始化
export const FOOD_INIT = url+'dish/list';
//增加菜品
export const ADD_FOOD = url+'dish/add';
//修改菜品
export const UPLOAD_FOOD = url+'dish/update';
//删除菜品
export const DELETE_FOOD = url+'dish/delete';
//查询桌子
export const DESK_SEARCH = url+'desk/list';
//提交订单
export const PUSH_ORDER = url+'orders/add';
//结账
export const END_ORDER = url+'orders/settleAccount';
//查看订单明细
export const SEE_ORDER_DETAILS = url+'orderitem/ordersId';
//上菜
export const SUBMIT_FOOD = url+'orderitem/updish';
//根据订单id查询订单明细
export const GET_ORDER_INFO = url+'orderitem/ordersId';
//根据页码请求订单list
export const GET_ORDER_BY_PAGENUMBER = url+'orders/slist';










