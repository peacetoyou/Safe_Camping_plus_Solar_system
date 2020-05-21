package com.model;

public class SolarDTO {

	private String sun_realtime;	
	private String sun_day;
	private String sun_month;
	
	private String street_lamp;
	private String tent;
	private String toilet;
	private String office;
	
	public SolarDTO(String sun_realtime, String sun_day, String sun_month, String street_lamp, String tent,
			String toilet, String office) {		
		this.sun_realtime = sun_realtime;
		this.sun_day = sun_day;
		this.sun_month = sun_month;
		this.street_lamp = street_lamp;
		this.tent = tent;
		this.toilet = toilet;
		this.office = office;
	}

	public String getSun_realtime() {
		return sun_realtime;
	}

	public void setSun_realtime(String sun_realtime) {
		this.sun_realtime = sun_realtime;
	}
	
	public String getSun_day() {
		return sun_day;
	}

	public void setSun_day(String sun_day) {
		this.sun_day = sun_day;
	}

	public String getSun_month() {
		return sun_month;
	}

	public void setSun_month(String sun_month) {
		this.sun_month = sun_month;
	}
	
	
	
	public String getStreet_lamp() {
		return street_lamp;
	}

	public void setStreet_lamp(String street_lamp) {
		this.street_lamp = street_lamp;
	}

	public String getTent() {
		return tent;
	}

	public void setTent(String tent) {
		this.tent = tent;
	}

	public String getToilet() {
		return toilet;
	}

	public void setToilet(String toilet) {
		this.toilet = toilet;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}
}
