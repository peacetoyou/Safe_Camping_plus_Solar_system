package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class deckSensorDAO {
	
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
			
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	}
	
	private deckSensorDTO selectSensor(String deck) {
		deckSensorDTO dto = null;
		
		try {
			getConnection();
			
			String sql = "select * from deck_sensors where deck_num=? ";
			pst = conn.prepareStatement(sql);
			pst.setString(1, deck);
		
			
			rs = pst.executeQuery();
			if(rs.next()) {
				String deck_num = rs.getString(1);
				int invade_ck = Integer.parseInt(rs.getString(2));
				int fire_ck = Integer.parseInt(rs.getString(3));
				dto = new deckSensorDTO(deck_num,invade_ck,fire_ck);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}

}
