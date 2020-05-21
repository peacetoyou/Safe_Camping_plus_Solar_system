package com.model;

public class EDataDTO {

	private String cr_place;
	private String cr_date;
	private int cr_time;
	private int cr_curr;
	private int bt_charged;
	
	public EDataDTO(String cr_place, String cr_date, int cr_time, int cr_curr, int bt_charged) {
		this.cr_place = cr_place;
		this.cr_date = cr_date;
		this.cr_time = cr_time;
		this.cr_curr = cr_curr;
		this.bt_charged = bt_charged;
	}

	public String getCr_place() {
		return cr_place;
	}

	public void setCr_place(String cr_place) {
		this.cr_place = cr_place;
	}

	public String getCr_date() {
		return cr_date;
	}

	public void setCr_date(String cr_date) {
		this.cr_date = cr_date;
	}

	public int getCr_time() {
		return cr_time;
	}

	public void setCr_time(int cr_time) {
		this.cr_time = cr_time;
	}

	public int getCr_curr() {
		return cr_curr;
	}

	public void setCr_curr(int cr_curr) {
		this.cr_curr = cr_curr;
	}

	public int getBt_charged() {
		return bt_charged;
	}

	public void setBt_charged(int bt_charged) {
		this.bt_charged = bt_charged;
	}
	
	
	
	
}
