package com.model;

public class MemberDTO {

	private int id;
	private String tel;
	private int deck_num;
	
	public MemberDTO(int id, String tel, int deck_num) {
		this.id = id;
		this.tel = tel;
		this.deck_num = deck_num;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getDeck_num() {
		return deck_num;
	}

	public void setDeck_num(int deck_num) {
		this.deck_num = deck_num;
	}
	
	
	
}
