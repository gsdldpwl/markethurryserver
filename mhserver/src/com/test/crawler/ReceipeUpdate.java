package com.test.crawler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.user.main.DBUtil;

public class ReceipeUpdate {

	public static void main(String[] args) {
		
		try {
			
			
			Connection conn = new DBUtil().open();
			Statement stat = null;
			PreparedStatement pstat = null;
			ResultSet rs = null;
			
			String sql = "select seq,img from receipe order by seq";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			while(rs.next()) {
				String img = rs.getString("img");
				
				sql = "update receipe set img=? where seq=?";
				pstat = conn.prepareStatement(sql);

				
				pstat.setString(1, img.substring(img.lastIndexOf("/")+1) + ".png");
				pstat.setString(2, rs.getString("seq"));
				pstat.executeUpdate();
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
