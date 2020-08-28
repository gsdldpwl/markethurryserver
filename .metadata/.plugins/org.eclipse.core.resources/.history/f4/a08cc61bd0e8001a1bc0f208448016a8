package com.test.admin.statistics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.user.main.DBUtil;

public class RankingDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public RankingDAO() {
		DBUtil util = new DBUtil();
		conn = util.open();
	}
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	public ArrayList<String> categorylist() {
		
		try {
			
			String sql = "select distinct category from product order by category asc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<String> list = new ArrayList<String>();
			
			while (rs.next()) {
				list.add(rs.getString("category"));
			}
			
		} catch (Exception e) {
			System.out.println("RankingDAO.categorylist()");
			e.printStackTrace();
		}
		
		return null;
	}

}
