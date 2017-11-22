package com.choice.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choice.common.ServerResponse;
import com.choice.entity.Dish;
import com.choice.service.DishService;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@RequestMapping("/dish")
public class DishController {
	@Autowired
	private DishService dishService;


	/**
	 * 根据菜品分类id查询该分类下所有菜品
	 * @param catelog
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "catelog")
	@ResponseBody
	public ServerResponse queryDishByCatelog(String catelog, HttpServletResponse response) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return dishService.queryDishByCatelog(catelog);
	}

	/**
	 * 新增菜品
	 * @param dish
	 * @param result
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "add")
	@ResponseBody
	public ServerResponse addDish(@Valid Dish dish, BindingResult result, HttpServletResponse response)throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		if(result.hasErrors()){
			return dishService.judgeAttribute(result);
		}
		return dishService.addDish(dish);
	}

	/**
	 * 更新菜品
	 * @param dish
	 * @param result
	 * @param response
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public ServerResponse updateDish(@Valid Dish dish, BindingResult result,HttpServletResponse response)throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		if(result.hasErrors()){
			return dishService.judgeAttribute(result);
		}
		return dishService.updateDish(dish);
	}

	/**
	 * 删除菜品
	 * @param id
	 * @param response
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public ServerResponse deleteDish(Integer id,HttpServletResponse response)throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return dishService.deleteDish(id);
	}

	/**
	 * 根据菜品汉拼首字母模糊查询菜品
	 * @param cn
	 * @param response
	 * @return
	 */
	@RequestMapping("cn")
	@ResponseBody
	public ServerResponse<List<Dish>> queryDishByCn(String cn,HttpServletResponse response)throws Exception{

		response.setHeader("Access-Control-Allow-Origin", "*");
		return dishService.queryDishByCn(cn);
	}

	/**
	 * 根据菜品名称和菜品上架时间查询菜品
	 * @param dName
	 * @param sdDate
	 * @param edDate
	 * @param response
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public ServerResponse queryDishByNameAndDate(String dName, String sdDate, String edDate,HttpServletResponse response)throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return dishService.queryDishByNameAndDate(dName,sdDate,edDate);
	}
	/*@RequestMapping("/")
	@ResponseBody
	public ServerResponse<PageInfo> queryDish(Integer pageNum,Integer pageSize){
		return dishService.queryDish(pageNum,pageSize);
	}*/
	/***
	 * 查询售空菜品数量
	 * @param response
	 * @return
	 */
	@RequestMapping("none/count")
	@ResponseBody
	public ServerResponse<String> queryDishCountWithNone(HttpServletResponse response) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		ServerResponse<String> result = dishService.queryDishCountWithNone();
		return result;
	}
	/**
	 * 查询菜品不足的数量
	 * @param response
	 * @return
	 */
	@RequestMapping("notEnough/count")
	@ResponseBody
	public ServerResponse<String> queryDishCountithNotEnough(HttpServletResponse response) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		ServerResponse<String> result = dishService.queryDishCountithNotEnough();
		return result;
	}
	/***
	 * 查询菜品总数量
	 * @param response
	 * @return
	 */
	@RequestMapping("count")
	@ResponseBody
	public ServerResponse<String> queryDishCount(HttpServletResponse response) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		ServerResponse<String> result = dishService.queryDishCount();
		return result;
	}
	/***
	 * 查询售空菜品列表
	 * @param response
	 * @return
	 */
	@RequestMapping("none/list")
	@ResponseBody
	public ServerResponse<List<Dish>> queryDishWithNone(HttpServletResponse response) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		ServerResponse<List<Dish>> result = dishService.queryDishWithNone();
		return result;
	}

}
