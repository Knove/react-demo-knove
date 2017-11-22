package com.choice.service.impl;

import com.choice.common.Const;
import com.choice.common.ServerResponse;
import com.choice.entity.Desk;
import com.choice.mapper.DeskMapper;
import com.choice.mapper.JedisClient;
import com.choice.service.DeskService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeskServiceImpl implements DeskService {
	@Autowired
	private DeskMapper deskMapper;

	@Autowired
	JedisClient jedisClient;

	/**
	 * 查询所有桌子的方法
	 */
	public ServerResponse<List<Desk>> queryAllDesk() throws Exception{
		List<Desk> desks=deskMapper.selectAllDesk();
		return ServerResponse.createBySuccess(desks);

	}
	/**
	 * 根据桌子编号查询桌子
	 */
	public ServerResponse<Desk> queryDeskByNum(String num) throws Exception{
		Desk desk=deskMapper.selectDeskById(num);
		return ServerResponse.createBySuccess(desk);

	}

	/**
	 * 修改桌子状态  
	 */
	@Override
	public ServerResponse updateDeskStatusByNum(String deNum,String status) throws Exception{
		// TODO Auto-generated method stub
		Integer success=deskMapper.updateDeskStatusByNum(deNum, status);
		return ServerResponse.createBySuccess();

	}
}
