package com.model;

public class UseDTO {

	private String facility;
	private String date;
	private String time;
	private String curr;
	
	public UseDTO(String facility, String date, String time, String curr) {		
		this.facility = facility;
		this.date = date;
		this.time = time;
		this.curr = curr;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		this.facility = facility;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCurr() {
		return curr;
	}

	public void setCurr(String curr) {
		this.curr = curr;
	}
	
	
}
