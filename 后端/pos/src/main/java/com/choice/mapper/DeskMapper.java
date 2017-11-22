package com.choice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.choice.entity.Desk;

public interface DeskMapper {
	//查询全部桌号方法
	List<Desk> selectAllDesk();
	//根据桌号查询桌子信息
	Desk selectDeskById(String id);
	//根据桌子ID修改桌子状态
	Integer updateDeskStatusByNum(@Param("deNum")String deNum,
									@Param("status")String status);
	
}
