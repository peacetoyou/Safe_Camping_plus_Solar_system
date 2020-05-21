package com.model;

public class RealtimeDTO {


	private int cr_num;
	private int cr_watt;

	
	public RealtimeDTO(int cr_num, int cr_watt) {
		this.cr_num = cr_num;
		this.cr_watt = cr_watt;
	}


	public int getCr_num() {
		return cr_num;
	}


	public void setCr_num(int cr_num) {
		this.cr_num = cr_num;
	}


	public int getCr_watt() {
		return cr_watt;
	}


	public void setCr_watt(int cr_watt) {
		this.cr_watt = cr_watt;
	}

	
	
}
