package com.model;

public class ProTimeDTO {
	
	private int time;
	private float curr;
	
	public ProTimeDTO(int time, float curr) {	
		this.time = time;
		this.curr = curr;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public float getCurr() {
		return curr;
	}

	public void setCurr(float curr) {
		this.curr = curr;
	}
	
	
	
	

}
