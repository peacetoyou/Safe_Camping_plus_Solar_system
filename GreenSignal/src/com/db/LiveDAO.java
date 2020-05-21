package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LiveDAO {
	
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
	
	public String uploadLive(String watt) {
		int cnt = 0;
		String result = "fail";
		try {
			getConnection();
			
			String sql = "insert into create_curr_live values(cr_curr_num.nextval,?,sysdate)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, watt);
			
			cnt = pst.executeUpdate();
			if(cnt>0) {
				result = "success";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return result;
	}

}
