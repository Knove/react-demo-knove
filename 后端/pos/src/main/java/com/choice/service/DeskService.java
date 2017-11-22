package com.choice.service;

import com.choice.common.ServerResponse;
import com.choice.entity.Desk;

import java.util.List;

public interface DeskService {
    //查询所有桌子
    ServerResponse<List<Desk>> queryAllDesk() throws Exception;
    //根据桌子编号查询桌子
    ServerResponse<Desk> queryDeskByNum(String num) throws Exception;
    //根据桌子ID修改桌子状态
    ServerResponse updateDeskStatusByNum(String deNum,String status) throws Exception;
}
