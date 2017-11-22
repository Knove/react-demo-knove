package com.choice.service;

import com.choice.common.ServerResponse;
import com.choice.entity.DishCatelog;

import java.util.List;

public interface DishCatelogService {
    //查询全部菜品种类
    ServerResponse<List<DishCatelog>> queryAllDishCatelog() throws Exception;

}
