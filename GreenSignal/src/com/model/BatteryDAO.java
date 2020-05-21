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

public class BatteryDAO {
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

	public BatteryDTO select() {
		BatteryDTO dto = null;

		try {
			getConnection();

			String sql = "SELECT * FROM CR_BT WHERE BT_NUM = (SELECT MAX(BT_NUM) FROM CR_BT)";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int bt_num = rs.getInt(1);
				int bt_charge = rs.getInt(2);
				dto = new BatteryDTO(bt_num, bt_charge);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
}
