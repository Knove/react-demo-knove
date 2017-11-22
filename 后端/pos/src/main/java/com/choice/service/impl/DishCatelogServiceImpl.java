package com.choice.service.impl;

import com.choice.common.ServerResponse;
import com.choice.entity.DishCatelog;
import com.choice.mapper.DishCatelogMapper;
import com.choice.service.DishCatelogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DishCatelogServiceImpl implements DishCatelogService {

    @Autowired
    private DishCatelogMapper dishCatelogMapper;
    public ServerResponse<List<DishCatelog>> queryAllDishCatelog() throws Exception{
        List<DishCatelog> dishCatelogList = null;
        dishCatelogList = dishCatelogMapper.selectList();
        return ServerResponse.createBySuccess(dishCatelogList);
    }
}
