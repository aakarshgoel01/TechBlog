package com.techblog.entities;

public class Message {
	
	private String type;
	private String content;
	private String cssClass;
	
	
	public Message(String type, String content, String cssClass) {
		super();
		this.type = type;
		this.content = content;
		this.cssClass = cssClass;
	}
	
	
	//generate getters and setters
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	

}
