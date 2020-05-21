package com.db;

public class memberDTO {
	private String id,pw,deck_num;

	public memberDTO(String id, String pw, String deck_num) {
		super();
		this.id = id;
		this.pw = pw;
		this.deck_num = deck_num;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getDeck_num() {
		return deck_num;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setDeck_num(String deck_num) {
		this.deck_num = deck_num;
	}
	
	
}
