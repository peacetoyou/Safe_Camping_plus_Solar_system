package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HelpDAO {
	
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
	
	public String insertRequest(HelpDTO dto) {
		int cnt = 0;
		String result = "fail";
		try {
			getConnection();
			
			String sql = "insert into camp_help values(?,sysdate,?,help_num_seq.nextval)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getId());
			pst.setString(2, dto.getRequest());
			
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
