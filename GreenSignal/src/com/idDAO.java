package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class idDAO {

	
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
	
	public String ckDBid(String ckid) {
		String dbid=""; 
		try {
			getConnection();
			
			String sql = "select * from randomid";
			pst = conn.prepareStatement(sql);
			pst.setString(1, ckid);
			
			rs = pst.executeQuery();
			if(rs.next()) {
				dbid = rs.getString(1);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dbid;
	}
	
	
	
	
	
}
