package com.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;


public class ReservationDAO {
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;   

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
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
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

   public ArrayList<ReservationDTO> select() {
      ArrayList<ReservationDTO> temp = new ArrayList<ReservationDTO>();

      try {
         getConnection();
         String sql = "SELECT * FROM CAMP_RESERVE";
         ps = conn.prepareStatement(sql);
         rs = ps.executeQuery();

         while (rs.next()) {
            String name = rs.getString(1);
            String tel = rs.getString(2);
            int id = rs.getInt(3);
            int deck_num = rs.getInt(4);
            String in_date = rs.getString(5);
            String out_date = rs.getString(6);
            
            SimpleDateFormat transformat = new SimpleDateFormat("yyyy-MM-dd");
            try {
				Date date_change = transformat.parse(in_date);
				in_date = transformat.format(date_change);
				
				date_change = transformat.parse(out_date);
				out_date = transformat.format(date_change);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            temp.add(new ReservationDTO(name, tel, id, deck_num, in_date, out_date));
         }

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close();
      }
      return temp;

   }

   public int delete(int id) {
      int cnt = 0;

      try {
         getConnection();
         String sql = "delete from CAMP_RESERVE where id=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, id);
         cnt = ps.executeUpdate();
         if(cnt > 0) {
            System.out.println("예약 삭제 성공");
         } else {
            System.out.println("예약 삭제 실패");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return cnt;
   }
   
   public int delete2(int id) {
	      int cnt = 0;

	      try {
	         getConnection();
	         String sql = "delete from CAMP_MEMBER where id=?";
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, id);
	         cnt = ps.executeUpdate();
	         if(cnt > 0) {
	            System.out.println("예약 삭제 성공");
	         } else {
	            System.out.println("예약 삭제 실패");
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return cnt;
	   }
   
   
   public int sendMsg(ReservationDTO dto) {
      int cnt = 0;

      try {
         getConnection();

         String sql = "insert into CAMP_RESERVE values(?,?,?,?,?,?)";
         ps = conn.prepareStatement(sql);

         ps.setString(1, dto.getName());
         ps.setString(2, dto.getTel());
         ps.setInt(3, dto.getId());
         ps.setInt(4, dto.getDeck_num());
         ps.setString(5, dto.getIn_date());
         ps.setString(6, dto.getOut_date());

         cnt = ps.executeUpdate();

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }

      return cnt;

   }
   
   public int sendMsg2(MemberDTO dto) {
	      int cnt = 0;

	      try {
	         getConnection();

	         String sql = "insert into CAMP_MEMBER values(?,?,?)";
	         ps = conn.prepareStatement(sql);

	         ps.setInt(1, dto.getId());
	         ps.setString(2, dto.getTel());
	         ps.setInt(3, dto.getDeck_num());

	         cnt = ps.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }

	      return cnt;

	   }

}