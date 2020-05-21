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

public class tentSensorDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	ArrayList<tentSensorDTO> list = new ArrayList<tentSensorDTO>();
	  
	
	private void getConnection() {

		try {
			// 2. Connection
			InputStream in = this.getClass().getResourceAsStream("db.properties");
			Properties p = new Properties();
			p.load(in);

			Class.forName(p.getProperty("driver"));
			String db_url = p.getProperty("url");
			String db_id = p.getProperty("id");
			String db_pw = p.getProperty("pw");
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (ClassNotFoundException | SQLException e) {
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
	public ArrayList<tentSensorDTO> selectSen(){
		getConnection();		
		tentSensorDTO dto;
		
		try {
			String sql="select deck_num,invade_ck,fire_ck from DECK_SENSORS";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
						
			while(rs.next()) {	
				int deck_num=rs.getInt(1);
				int invade_ck = rs.getInt(2);
				int fire_ck = rs.getInt(3);
				dto = new tentSensorDTO(deck_num,invade_ck,fire_ck);
				list.add(dto);
			}				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}

}
