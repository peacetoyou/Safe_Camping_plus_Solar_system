package com.model;

public class ReservationDTO {

	private String name;
	private String tel;
	private int id;
	private int deck_num;
	private String in_date;
	private String out_date;

	public ReservationDTO(int id) {
		this.id = id;
	}

	public ReservationDTO(String name, String tel, int id, int deck_num, String in_date, String out_date) {
		this.name = name;
		this.tel = tel;
		this.id = id;
		this.deck_num = deck_num;
		this.in_date = in_date;
		this.out_date = out_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDeck_num() {
		return deck_num;
	}

	public void setDeck_num(int deck_num) {
		this.deck_num = deck_num;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

	public String getOut_date() {
		return out_date;
	}

	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}

}