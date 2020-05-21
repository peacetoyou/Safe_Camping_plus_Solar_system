package com.model;

public class BatteryDTO {
	
	private int bt_num;
	private int bt_charge;
	private int bt_uncharge;
	private String bt_info;
	
	public BatteryDTO(int bt_num, int bt_charge) {	
		this.bt_num = bt_num;
		this.bt_charge = bt_charge;
	}
	
	public BatteryDTO(int bt_charge, int bt_uncharge, String bt_info) {	
		this.bt_charge = bt_charge;
		this.bt_uncharge = bt_uncharge;
		this.bt_info = bt_info;
	}
	
	public int getBt_num() {
		return bt_num;
	}

	public void setBt_num(int bt_num) {
		this.bt_num = bt_num;
	}

	public int getBt_charge() {
		return bt_charge;
	}

	public void setBt_charge(int bt_charge) {
		this.bt_charge = bt_charge;
	}

	public String getBt_info() {
		return bt_info;
	}

	public void setBt_info(String bt_info) {
		this.bt_info = bt_info;
	}
	
}
