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

public class EDataDAO {
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

	public ArrayList<EDataDTO> select(String keyword, String strDateOrMonth) {

		ArrayList<EDataDTO> list = new ArrayList<EDataDTO>();

		try {
			getConnection();

			// 오늘 시간별 전기 생산량
			if (keyword.equals("proTime")) {
				String sql = "SELECT * FROM CREATE_CUR_SOLAR WHERE CR_DATE = ? ORDER BY CR_TIME";
				ps = conn.prepareStatement(sql);
				ps.setString(1, strDateOrMonth);
				rs = ps.executeQuery();

				while (rs.next()) {
					String cr_place = rs.getString(1);
					String cr_date = rs.getString(2);
					int cr_time = rs.getInt(3);
					int cr_curr = rs.getInt(4);
					int bt_charged = rs.getInt(5);
					EDataDTO dto = new EDataDTO(cr_place, cr_date, cr_time, cr_curr, bt_charged);
					list.add(dto);
				}

		    // 이번달 일별 전기 생산량
			} else if(keyword.equals("proDay")) {
				String t1 = strDateOrMonth + "01";
				String t2 = strDateOrMonth + "30";
				String sql = "SELECT * FROM CREATE_CUR_SOLAR WHERE CR_DATE BETWEEN ? AND ? ORDER BY CR_DATE, CR_TIME DESC";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, t1);
				ps.setString(2, t2);
				rs = ps.executeQuery();
			
				while (rs.next()) {
					String cr_place = rs.getString(1);	
					String cr_date = rs.getString(2);
					int cr_time = rs.getInt(3);
					int cr_curr = rs.getInt(4);
					int bt_charged = rs.getInt(5);
					EDataDTO dto = new EDataDTO(cr_place, cr_date, cr_time, cr_curr, bt_charged);
					list.add(dto);
				}
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	
	
	public ArrayList<UseDTO> select(String keyword, String strDate, String strTime) {
		ArrayList<UseDTO> list = new ArrayList<UseDTO>();
		try {
			getConnection();

			if (keyword.equals("use")) {			
				String sql = "SELECT * FROM USED_CUR";
//				 WHERE USE_DATE = ? AND USE_TIME = ?
				ps = conn.prepareStatement(sql);
//				ps.setString(1, strDate);
				rs = ps.executeQuery();

				while (rs.next()) {
					String facility = rs.getString(1);
					String date = rs.getString(2);
					String time = rs.getInt(3)+"";
					String curr = rs.getInt(4)+"";
					UseDTO dto = new UseDTO(facility, date, time, curr);
					list.add(dto);
				}
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

}
