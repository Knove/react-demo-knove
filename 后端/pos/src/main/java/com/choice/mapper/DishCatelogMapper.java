package com.choice.mapper;

import com.choice.entity.DishCatelog;

import java.util.List;

public interface DishCatelogMapper {
    //查询全部菜品分类
    List<DishCatelog> selectList();
}
