package com.model;

public class PowerDTO {

	private String powerItem;
	private int powerState;
	
	public PowerDTO(String powerItem, int powerState) {	
		this.powerItem = powerItem;
		this.powerState = powerState;
	}

	public String getPowerItem() {
		return powerItem;
	}

	public void setPowerItem(String powerItem) {
		this.powerItem = powerItem;
	}

	public int getPowerState() {
		return powerState;
	}

	public void setPowerState(int powerState) {
		this.powerState = powerState;
	}
	
	
	
}
