package com.choice.entity;

public class DishCatelog {
	private Integer id;
	private String dcName;//菜品类目名称

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDcName() {
		return dcName;
	}

	public void setDcName(String dcName) {
		this.dcName = dcName;
	}

	public DishCatelog(Integer id, String dcName) {
		this.id = id;
		this.dcName = dcName;
	}

	public DishCatelog() {
	}

	@Override
	public String toString() {
		return "DishCatelog{" +
				"id=" + id +
				", dcName='" + dcName + '\'' +
				'}';
	}
}
