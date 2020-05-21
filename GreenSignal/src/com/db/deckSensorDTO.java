package com.db;

public class deckSensorDTO {
	private String deck_num;
	private int invade_ck , fire_ck;
	
	public deckSensorDTO(String deck_num, int invade_ck, int fire_ck) {
		super();
		this.deck_num = deck_num;
		this.invade_ck = invade_ck;
		this.fire_ck = fire_ck;
	}
	
	public String getDeck_num() {
		return deck_num;
	}
	public int getInvade_ck() {
		return invade_ck;
	}
	public int getFire_ck() {
		return fire_ck;
	}
	
	public void setDeck_num(String deck_num) {
		this.deck_num = deck_num;
	}
	public void setInvade_ck(int invade_ck) {
		this.invade_ck = invade_ck;
	}
	public void setFire_ck(int fire_ck) {
		this.fire_ck = fire_ck;
	}
	
	
}
