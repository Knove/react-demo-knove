package com.choice.controller;

import com.choice.common.ServerResponse;
import com.choice.entity.DishCatelog;
import com.choice.service.DishCatelogService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

import java.util.List;

@Controller
@RequestMapping("/dishCatelog")
public class DishCatelogController {

    @Autowired
    public DishCatelogService dishCatelogService;
    
    @RequestMapping("list")
    @ResponseBody
    public ServerResponse queryAllDishCatelog(HttpServletResponse response) throws Exception{
        response.setHeader("Access-Control-Allow-Origin", "*");
        return dishCatelogService.queryAllDishCatelog();
    }
}
