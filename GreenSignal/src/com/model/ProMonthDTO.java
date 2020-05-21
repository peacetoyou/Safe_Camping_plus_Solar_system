package com.model;

public class ProMonthDTO {
	
	private int month;
	private int curr;
	
	public ProMonthDTO(int month, int curr) {	
		this.month = month;
		this.curr = curr;
	}

	public int getDay() {
		return month;
	}

	public void setDay(int month) {
		this.month = month;
	}

	public int getCurr() {
		return curr;
	}

	public void setCurr(int curr) {
		this.curr = curr;
	}

	
	
	
	
	

}
