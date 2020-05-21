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

import javax.xml.ws.RespectBinding;

public class LoginDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private static LoginDAO dao;

	private LoginDAO() {

	}

	public static LoginDAO getDAO() {
		if (dao == null) {
			dao = new LoginDAO();
		}
		return dao;
	}

	private void getConnection() {
		try {

			InputStream in = this.getClass().getResourceAsStream("db.properties");
			Properties p = new Properties();
			p.load(in);

			Class.forName(p.getProperty("driver"));
			String db_url = p.getProperty("url");
			String db_id = p.getProperty("id");
			;
			String db_pw = p.getProperty("pw");
			;
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
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public LoginDTO login(LoginDTO dto) {
		LoginDTO info = null;

		try {
			getConnection();

			String sql = "select * from web_member where email = ? and pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			rs = psmt.executeQuery();
			if (rs.next()) {
				String email = rs.getString(1);
				String pw = rs.getString(2);
				info = new LoginDTO(email, pw);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return info;
	}

}