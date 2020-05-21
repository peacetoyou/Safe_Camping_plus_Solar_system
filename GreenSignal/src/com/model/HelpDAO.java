package com.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class HelpDAO {
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;

   ArrayList<HelpDTO> list = new ArrayList<HelpDTO>();
     
   
   private void getConnection() {

      try {
         
         InputStream in = this.getClass().getResourceAsStream("db.properties");
         Properties p = new Properties();
         p.load(in);

         Class.forName(p.getProperty("driver"));
         String db_url = p.getProperty("url");
         String db_id = p.getProperty("id");
         String db_pw = p.getProperty("pw");
         conn = DriverManager.getConnection(db_url, db_id, db_pw);
        
      } catch (ClassNotFoundException | SQLException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

   private void close() {
      try {
         if (rs != null)
            rs.close();
         if (ps != null)
            ps.close();
         if (conn != null)
            conn.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
   
   
   
   
   public ArrayList<HelpDTO> select(String deck) {
      getConnection();      
      HelpDTO dto;
      
      try {
         
         String sql="SELECT CAMP_HELP.ID, CAMP_RESERVE.DECK_NUM, CAMP_RESERVE.NAME, CAMP_RESERVE.TEL, CAMP_HELP.HELP_DATE, CAMP_HELP.HELP_CONTENT FROM CAMP_HELP, CAMP_RESERVE "
               + "WHERE CAMP_HELP.HELP_CONTENT IS NOT null AND CAMP_HELP.ID = CAMP_RESERVE.ID AND CAMP_RESERVE.DECK_NUM = ?";
         
//         String sql="SELECT CAMP_HELP.ID, CAMP_RESERVE.DECK_NUM, CAMP_HELP.HELP_DATE, CAMP_HELP.HELP_CONTENT \r\n" + 
//               "FROM CAMP_HELP, CAMP_RESERVE WHERE CAMP_HELP.ID = CAMP_RESERVE.ID AND CAMP_HELP.HELP_CONTENT IS NOT null"
//               + "AND WHERE to_date(CAMP_RESERVE.out_date)<=to_date('05-11-2020 23:00:00','mm-dd-yyyy hh24:mi:ss')"
//               + "AND to_date(CAMP_RESERVE.in_date)>=to_date('05-02-2020 16:00:00','mm-dd-yyyy hh24:mi:ss')";
            
         ps=conn.prepareStatement(sql);
         int deckNum = Integer.parseInt(deck);
         ps.setInt(1, deckNum);
         rs = ps.executeQuery();
         
         
         
         while(rs.next()) {   
            int id = rs.getInt(1);
            int deck_num = rs.getInt(2);
            String name = rs.getString(3);
            String tel = rs.getString(4);
            String date = rs.getString(5);
            String content = rs.getString(6);
            dto = new HelpDTO(id, deck_num, name, tel, date, content);
            list.add(dto);
         }            
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close();
      }
      return list;
   }

   
   public ArrayList<HelpDTO> select() {
         getConnection();      
         HelpDTO dto;
         
         try {
            
            String sql="SELECT CAMP_HELP.ID, CAMP_RESERVE.DECK_NUM, CAMP_RESERVE.NAME, CAMP_RESERVE.TEL, CAMP_HELP.HELP_DATE, CAMP_HELP.HELP_CONTENT FROM CAMP_HELP, CAMP_RESERVE "
                  + "WHERE CAMP_HELP.HELP_CONTENT IS NOT null AND CAMP_HELP.ID = CAMP_RESERVE.ID";
            
//            String sql="SELECT CAMP_HELP.ID, CAMP_RESERVE.DECK_NUM, CAMP_HELP.HELP_DATE, CAMP_HELP.HELP_CONTENT \r\n" + 
//                  "FROM CAMP_HELP, CAMP_RESERVE WHERE CAMP_HELP.ID = CAMP_RESERVE.ID AND CAMP_HELP.HELP_CONTENT IS NOT null"
//                  + "AND WHERE to_date(CAMP_RESERVE.out_date)<=to_date('05-11-2020 23:00:00','mm-dd-yyyy hh24:mi:ss')"
//                  + "AND to_date(CAMP_RESERVE.in_date)>=to_date('05-02-2020 16:00:00','mm-dd-yyyy hh24:mi:ss')";
               
            ps=conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()) {   
               int id = rs.getInt(1);
               int deck_num = rs.getInt(2);
               String name = rs.getString(3);
               String tel = rs.getString(4);
               String date = rs.getString(5);
               String content = rs.getString(6);
               dto = new HelpDTO(id, deck_num, name, tel, date, content);
               list.add(dto);
            }            
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            close();
         }
         return list;
      }

}