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

public class tentTimeDAO {
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;

   ArrayList<tentTimeDTO> list = new ArrayList<tentTimeDTO>();
     
   
   private void getConnection() {

      try {
         // 2. Connection
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
   public ArrayList<tentTimeDTO> selectTime() {
      getConnection();      
      tentTimeDTO dto;
      
      try {
         String sql="select deck_num, (trunc(out_date,'mi')-trunc(sysdate,'mi'))*1440 from camp_reserve where to_date(out_date)<=to_date('05-30-2020 12:00:00','mm-dd-yyyy hh24:mi:ss') and to_date(in_date)>=to_date('05-02-2020 16:00:00','mm-dd-yyyy hh24:mi:ss')";
         ps=conn.prepareStatement(sql);
         rs = ps.executeQuery();
                  
         while(rs.next()) {   
            int deck_num = rs.getInt(1);
            int left_time = rs.getInt(2);
            dto = new tentTimeDTO(deck_num,left_time);
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