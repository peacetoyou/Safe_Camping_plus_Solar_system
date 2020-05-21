package com.model;

public class HelpDTO {

   private int id;
   private int deck_num;
   private String name;
   private String tel;
   private String date;
   private String content;
   
   public HelpDTO(int id, int deck_num, String name, String tel, String date, String content) {      
      this.id = id;
      this.deck_num = deck_num;
      this.name = name;
      this.tel = tel;
      this.date = date;
      this.content = content;
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

   public String getDate() {
      return date;
   }

   public void setDate(String date) {
      this.date = date;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }
   
   
   
   
   
}