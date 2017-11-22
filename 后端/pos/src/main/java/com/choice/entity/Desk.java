package com.choice.entity;

public class Desk {
	private Integer id;
	private String deNum;//桌子编号
	private String deStatus;//桌子状态 0：未使用 1：已使用
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDeNum() {
		return deNum;
	}
	public void setDeNum(String deNum) {
		this.deNum = deNum;
	}
	public String getDeStatus() {
		return deStatus;
	}
	public void setDeStatus(String deStatus) {
		this.deStatus = deStatus;
	}
	public Desk(Integer id, String deNum, String deStatus) {
		this.id = id;
		this.deNum = deNum;
		this.deStatus = deStatus;
	}
	public Desk() {
	}

	@Override
	public String toString() {
		return "Desk{" +
				"id=" + id +
				", deNum='" + deNum + '\'' +
				", deStatus='" + deStatus + '\'' +
				'}';
	}
}
