package com.db;

public class CampDTO {
	
	private String id,tel;
	private int deck_num;
	
	public String getId() {
		return id;
	}
	public String getTel() {
		return tel;
	}
	public int getDeck_num() {
		return deck_num;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setDeck_num(int deck_num) {
		this.deck_num = deck_num;
	}
	
	public CampDTO(String id, String tel, int deck_num) {
		super();
		this.id = id;
		this.tel = tel;
		this.deck_num = deck_num;
	}
	public CampDTO(String id, String tel) {
		this.id = id;
		this.tel = tel;
	}
	
	

}
