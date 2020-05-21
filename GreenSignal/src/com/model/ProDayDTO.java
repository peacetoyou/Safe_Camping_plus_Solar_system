package com.model;

public class ProDayDTO {
	
	private int day;
	private int curr;
	
	public ProDayDTO(int day, int curr) {	
		this.day = day;
		this.curr = curr;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getCurr() {
		return curr;
	}

	public void setCurr(int curr) {
		this.curr = curr;
	}

}
