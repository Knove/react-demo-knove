package com.choice.entity;

/**
 * 
 * @author liuxu
 *
 */
public class Student {
	private Integer sid;
	private String sname;
	private Integer tid;
	private Integer age;
	private String sex;
	
	public Student(Integer sid, String sname, Integer tid, Integer age,
			String sex) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.tid = tid;
		this.age = age;
		this.sex = sex;
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", sname=" + sname + ", tid=" + tid
				+ ", age=" + age + ", sex=" + sex + "]";
	}
	
}
