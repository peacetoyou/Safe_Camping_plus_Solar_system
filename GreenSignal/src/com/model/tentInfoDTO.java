package com.model;

public class tentInfoDTO {
   private String name;
   private int deck_num;
    private String tel;
    
   public tentInfoDTO(String name,int deck_num, String tel) {
      this.name = name;
      this.deck_num = deck_num;
      this.tel = tel;
   }
    
   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public int getDeck_num() {
      return deck_num;
   }

   public void setDeck_num(int deck_num) {
      this.deck_num = deck_num;
   }

   public String getTel() {
      return tel;
   }

   public void setTel(String tel) {
      this.tel = tel;
   }
}