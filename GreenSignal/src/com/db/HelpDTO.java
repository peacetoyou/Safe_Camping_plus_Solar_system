package com.db;

public class HelpDTO {
	private String id;
	private String request;
	
	public String getId() {
		return id;
	}
	public String getRequest() {
		return request;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public HelpDTO(String id, String request) {
		super();
		this.id = id;
		this.request = request;
	}
	
	
	
}
