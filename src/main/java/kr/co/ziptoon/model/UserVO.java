package kr.co.ziptoon.model;

import java.util.Date;

public class UserVO {
	private String id;
	private String password;
	private Date first;
	private Date last;
	private String sex;
	private int type;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getFirst() {
		return first;
	}
	public void setFirst(Date first) {
		this.first = first;
	}
	public Date getLast() {
		return last;
	}
	public void setLast(Date last) {
		this.last = last;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}	
}
