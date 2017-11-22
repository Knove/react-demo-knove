package com.choice.entity;

public class Orders {
	private Integer id;
	private String oNum;//订单编号
	private String oDate;//下单时间
	private String oStatus;//订单状态 0：已下单 1：待付款 2：已结账
	private String deId;//桌子id
	private String oTotal;//总计金额
	private String odCount;//订单菜品数量

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getoNum() {
		return oNum;
	}

	public void setoNum(String oNum) {
		this.oNum = oNum;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}

	public String getDeId() {
		return deId;
	}

	public void setDeId(String deId) {
		this.deId = deId;
	}

	public String getoTotal() {
		return oTotal;
	}

	public void setoTotal(String oTotal) {
		this.oTotal = oTotal;
	}

	public String getOdCount() {
		return odCount;
	}

	public void setOdCount(String odCount) {
		this.odCount = odCount;
	}

	public Orders(Integer id, String oNum, String oDate, String oStatus, String deId, String oTotal, String odCount) {
		this.id = id;
		this.oNum = oNum;
		this.oDate = oDate;
		this.oStatus = oStatus;
		this.deId = deId;
		this.oTotal = oTotal;
		this.odCount = odCount;
	}

	public Orders() {
	}

	@Override
	public String toString() {
		return "Orders{" +
				"id=" + id +
				", oNum='" + oNum + '\'' +
				", oDate='" + oDate + '\'' +
				", oStatus='" + oStatus + '\'' +
				", deId='" + deId + '\'' +
				", oTotal='" + oTotal + '\'' +
				", odCount='" + odCount + '\'' +
				'}';
	}
}
