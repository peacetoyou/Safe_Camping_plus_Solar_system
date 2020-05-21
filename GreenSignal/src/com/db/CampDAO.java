package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class CampDAO {
	
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
	
	public String loginId(CampDTO dto) {
		CampDTO log = null;
		String logid="error";
		
		try {
			getConnection();
			
			String sql = "SELECT * FROM camp_member WHERE id = ? and tel =?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getId());
			pst.setString(2, dto.getTel());
			
			rs = pst.executeQuery();
			if(rs.next()) {
				logid = rs.getString(1);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return logid;
	}

}
