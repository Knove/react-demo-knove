package com.choice.entity;

public class OrderItem {
	
	private Integer id;
	private String oId;//订单id
	private String dId;//菜品id
	private String oiCount;//单一菜品数量
	private String oiStatus;//订单菜品状态 0：未上菜 1：已上菜

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getoId() {
		return oId;
	}

	public void setoId(String oId) {
		this.oId = oId;
	}

	public String getdId() {
		return dId;
	}

	public void setdId(String dId) {
		this.dId = dId;
	}

	public String getOiCount() {
		return oiCount;
	}

	public void setOiCount(String oiCount) {
		this.oiCount = oiCount;
	}

	public String getOiStatus() {
		return oiStatus;
	}

	public void setOiStatus(String oiStatus) {
		this.oiStatus = oiStatus;
	}

	public OrderItem(Integer id, String oId, String dId, String oiCount, String oiStatus) {
		this.id = id;
		this.oId = oId;
		this.dId = dId;
		this.oiCount = oiCount;
		this.oiStatus = oiStatus;
	}

	public OrderItem() {
	}

	@Override
	public String toString() {
		return "OrderItem{" +
				"id=" + id +
				", oId='" + oId + '\'' +
				", dId='" + dId + '\'' +
				", oiCount='" + oiCount + '\'' +
				", oiStatus='" + oiStatus + '\'' +
				'}';
	}
}
