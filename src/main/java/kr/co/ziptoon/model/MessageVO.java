package kr.co.ziptoon.model;

import java.util.Date;

public class MessageVO {
	private int id;
	private String sendUser;
	private String receiveUser;
	private String text;
	private Date date;
	private String readYN;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSendUser() {
		return sendUser;
	}
	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}
	public String getReceiveUser() {
		return receiveUser;
	}
	public void setReceiveUser(String receiveUser) {
		this.receiveUser = receiveUser;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getReadYN() {
		return readYN;
	}
	public void setReadYN(String readYN) {
		this.readYN = readYN;
	}
}
