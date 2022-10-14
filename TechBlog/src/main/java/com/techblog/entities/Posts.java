package com.techblog.entities;

import java.sql.Timestamp;


public class Posts {
	
	private int pid;
	private String title;
	private String content;
	private String code;
	private String pic;
	private Timestamp date;
	private int cid;
	private int uid;
	
	public Posts(int pid, String title, String content, String code, String pic, Timestamp date, int cid , int uid) {
		super();
		this.pid = pid;
		this.title = title;
		this.content = content;
		this.code = code;
		this.pic = pic;
		this.date = date;
		this.cid = cid;
		this.uid = uid;
	}
	
	public Posts(String title, String content, String code, String pic, Timestamp date, int cid , int uid) {
		super();
		this.title = title;
		this.content = content;
		this.code = code;
		this.pic = pic;
		this.date = date;
		this.cid = cid;
		this.uid = uid;
	}
	
	public Posts() {
		super();
	}
	
	
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	
	
	
}
