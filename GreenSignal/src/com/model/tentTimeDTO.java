package com.model;

public class tentTimeDTO {
    private int deck_num;
    private int left_time;
    
	public tentTimeDTO(int deck_num, int left_time) {
		this.deck_num = deck_num;
		this.left_time = left_time;
	}

	public int getDeck_num() {
		return deck_num;
	}

	public void setDeck_num(int deck_num) {
		this.deck_num = deck_num;
	}

	public int getLeft_time() {
		return left_time;
	}

	public void setLeft_time(int left_time) {
		this.left_time = left_time;
	}
}
