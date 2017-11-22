package com.choice.service;

import com.choice.common.ServerResponse;
import com.choice.entity.Dish;
import com.github.pagehelper.PageInfo;
import org.springframework.validation.BindingResult;

import java.util.List;

public interface DishService {
    //根据菜品种类id查询菜品
    ServerResponse<List<Dish>> queryDishByCatelog(String catelog) throws Exception;
    //新增菜品
    ServerResponse addDish(Dish dish) throws Exception;
    //更新菜品
    ServerResponse updateDish(Dish dish) throws Exception;
    //删除菜品
    ServerResponse deleteDish(Integer id) throws Exception;
    //根据菜品汉拼首字母模糊查询菜品
    ServerResponse<List<Dish>> queryDishByCn(String cn) throws Exception;
    //根据菜品名称和上架日期查询菜品（分页）
    ServerResponse<List<Dish>> queryDishByNameAndDate(String dName, String sdDate, String edDate) throws Exception;
    //查询菜品（分页）
    ServerResponse<PageInfo> queryDish(Integer pageNum,Integer pageSize) throws Exception;
    //查询售空菜品
    ServerResponse<List<Dish>> queryDishWithNone() throws Exception;
    //查询售空菜品数量
    ServerResponse<String> queryDishCountWithNone()throws Exception;
    //查询余量不足菜品数
    ServerResponse<String> queryDishCountithNotEnough() throws Exception;
    //查询菜品种类数
    ServerResponse<String> queryDishCount()throws Exception;
    //参数验证
    ServerResponse judgeAttribute(BindingResult result) throws Exception;
}
