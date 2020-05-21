package com.db;

public class SensorDTO {
	
	// id 4, invade_ck 2, fire_ck 3 ,      deck_num 은 웹페이지에서 이용하기위해
	private String id;
	private String invade_ck;
	private String fire_ck;
	private String deck_num;
	
	public String getId() {
		return id;
	}
	public String getInvade_ck() {
		return invade_ck;
	}
	public String getFire_ck() {
		return fire_ck;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setInvade_ck(String invade_ck) {
		this.invade_ck = invade_ck;
	}
	public void setFire_ck(String fire_ck) {
		this.fire_ck = fire_ck;
	}
	
	public SensorDTO(String id, String invade_ck, String fire_ck) {
		super();
		this.id = id;
		this.invade_ck = invade_ck;
		this.fire_ck = fire_ck;
	}
	
	
	
}
