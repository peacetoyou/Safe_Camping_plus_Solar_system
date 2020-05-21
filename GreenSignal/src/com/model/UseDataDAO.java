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

public class UseDataDAO {
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

	
	public ArrayList<UseDTO> select(String strDate, String strTime) {
		ArrayList<UseDTO> list = new ArrayList<UseDTO>();

		try {
			getConnection();

			String sql = "SELECT * FROM USED_CUR";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs != null) {
				System.out.println("데이터 있음");
			} else {
				System.out.println("데이터 없음");
			}
			
			while (rs.next()) {
				String facility = rs.getString(1);
				String date = rs.getString(2);
				String time = rs.getInt(3)+"";
				String curr = rs.getInt(4)+"";
				UseDTO dto = new UseDTO(facility, date, time, curr);				
				list.add(dto);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	
}
