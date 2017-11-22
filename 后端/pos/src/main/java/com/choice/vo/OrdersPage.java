package com.choice.vo;

import java.util.List;

import com.choice.entity.Orders;

public class OrdersPage {
	private String totalOrders;//订单总数
	private String ototal;//订单总额
	private Integer pageSize;//页面记录数
	private Integer pageNum;//当前页数
	private List<Orders> olist;//订单的集合
	public String getTotalOrders() {
		return totalOrders;
	}
	public void setTotalOrders(String totalOrders) {
		this.totalOrders = totalOrders;
	}
	public String getOtotal() {
		return ototal;
	}
	public void setOtotal(String ototal) {
		this.ototal = ototal;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public List<Orders> getOlist() {
		return olist;
	}
	public void setOlist(List<Orders> olist) {
		this.olist = olist;
	}
	public OrdersPage(String totalOrders, String ototal, Integer pageSize,
			Integer pageNum, List<Orders> olist) {
		this.totalOrders = totalOrders;
		this.ototal = ototal;
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.olist = olist;
	}
	public OrdersPage() {
		
	}
	
	
}
