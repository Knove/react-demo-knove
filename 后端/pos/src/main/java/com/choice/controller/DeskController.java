package com.choice.controller;

import com.choice.common.ServerResponse;
import com.choice.entity.Desk;
import com.choice.service.DeskService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/desk")
public class DeskController {
	@Autowired
	private DeskService deskService;

	//查询所有桌子
	@RequestMapping("list")
	@ResponseBody
	public ServerResponse<List<Desk>> queryAllDesk(HttpServletResponse response) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return deskService.queryAllDesk();
	}
	//根据桌子编号查询桌子
	@RequestMapping("num")
	@ResponseBody
	public ServerResponse<Desk> queryDeskByNum(HttpServletResponse  response,String num) throws Exception{
		response.setHeader("Access-Control-Allow-Origin", "*");
		return deskService.queryDeskByNum(num);
	}
}
