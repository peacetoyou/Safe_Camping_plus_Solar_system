package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SensorDAO {
	
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	private void close() {
		try {
			if(rs!=null) 
				rs.close();
			if (conn != null)
				conn.close();
			if (pst != null)
				pst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	private void getConnection() {
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "hr";
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	}
	
	public String sensorInvadeCk(String id) {
		String invade_ck="";
		
		
		try {
			getConnection();
			
			String sql = "SELECT * FROM deck_sensors WHERE id = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
		
			rs = pst.executeQuery();
			if(rs.next()) {
				invade_ck = rs.getString(2);
				//String fire_ck = rs.getString(3);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return invade_ck;
	}
	//
	
	public String sensorFireCk(String id) {
		String fire_ck="";
		
		
		try {
			getConnection();
			
			String sql = "SELECT * FROM deck_sensors WHERE id = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
		
			rs = pst.executeQuery();
			if(rs.next()) {
				fire_ck = rs.getString(3);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		System.out.println(fire_ck);
		return fire_ck;
	}

	public String fireUpload(String id,String fire) {
		String msg = "fail";
		int fireck = Integer.parseInt(fire);
		int cnt = -1;
		try {
			getConnection();
			
			String sql = "update deck_sensors set fire_ck= ? where id =? ";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, fireck);
			pst.setString(2, id);
			
		
			cnt  = pst.executeUpdate();
			if(cnt >0) {
				msg = "success";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return msg;
	}
	
	public String invadeUpload(String id,String invade) {
		String msg = "fail";
		
		int cnt = -1;
		try {
			getConnection();
			
			String sql = "update deck_sensors set invade_ck= ? where id =? ";
			pst = conn.prepareStatement(sql);
			pst.setString(1, invade);
			pst.setString(2, id);
		
			cnt  = pst.executeUpdate();
			if(cnt >0) {
				msg = "success";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return msg;
	}
	
	
}
