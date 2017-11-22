package com.choice.entity;

import org.hibernate.validator.constraints.Range;

public class Dish {
	private Integer id;
	private String dcId;//菜品类目id
	private String dName;//菜品名称
	private String dCn;//菜品汉拼首字母
	private String dDate;//菜品上架日期
	private String dMaterial;//菜品原料
	private String dRemark;//菜品备注
	@Range(min=0,message = "数量小于0")
	private String dCount;//菜品库存数量
	@Range(min=0,message = "价格小于0")
	private String dPrice;//菜品价格
	private String dStatus;//菜品状态 0：已删除 1：未删除

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDcId() {
		return dcId;
	}

	public void setDcId(String dcId) {
		this.dcId = dcId;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getdCn() {
		return dCn;
	}

	public void setdCn(String dCn) {
		this.dCn = dCn;
	}

	public String getdDate() {
		return dDate;
	}

	public void setdDate(String dDate) {
		this.dDate = dDate;
	}

	public String getdMaterial() {
		return dMaterial;
	}

	public void setdMaterial(String dMaterial) {
		this.dMaterial = dMaterial;
	}

	public String getdRemark() {
		return dRemark;
	}

	public void setdRemark(String dRemark) {
		this.dRemark = dRemark;
	}

	public String getdCount() {
		return dCount;
	}

	public void setdCount(String dCount) {
		this.dCount = dCount;
	}

	public String getdPrice() {
		return dPrice;
	}

	public void setdPrice(String dPrice) {
		this.dPrice = dPrice;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	public Dish(Integer id, String dcId, String dName, String dCn, String dDate, String dMaterial, String dRemark, String dCount, String dPrice, String dStatus) {
		this.id = id;
		this.dcId = dcId;
		this.dName = dName;
		this.dCn = dCn;
		this.dDate = dDate;
		this.dMaterial = dMaterial;
		this.dRemark = dRemark;
		this.dCount = dCount;
		this.dPrice = dPrice;
		this.dStatus = dStatus;
	}

	public Dish() {
	}

	@Override
	public String toString() {
		return "Dish{" +
				"id=" + id +
				", dcId='" + dcId + '\'' +
				", dName='" + dName + '\'' +
				", dCn='" + dCn + '\'' +
				", dDate='" + dDate + '\'' +
				", dMaterial='" + dMaterial + '\'' +
				", dRemark='" + dRemark + '\'' +
				", dCount='" + dCount + '\'' +
				", dPrice='" + dPrice + '\'' +
				", dStatus='" + dStatus + '\'' +
				'}';
	}
}
