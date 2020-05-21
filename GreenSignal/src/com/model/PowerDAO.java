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

public class PowerDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	PowerDTO dto = null;
	ArrayList<PowerDTO> list = new ArrayList<PowerDTO>();
	
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

	public int update(String powerItem, String powerState) {		
		int cnt = 0;
		try {
			getConnection();
			String sql = "UPDATE POWER_CONTROL SET = ? WHERE POWER_ITEM = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, powerState);
			ps.setString(2, powerItem);
			cnt = ps.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	
	public ArrayList<PowerDTO> select() {	
		try {
			getConnection();

			String sql = "SELECT * FROM POWER_CONTROL";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String powerItem = rs.getString(1);
				int powerState = rs.getInt(2);

				dto = new PowerDTO(powerItem, powerState);
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
