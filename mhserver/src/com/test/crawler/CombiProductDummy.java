package com.test.crawler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import com.test.user.main.DBUtil;

/**
 * @author leeho
 * 묶음상품 더미 데이터
 */
public class CombiProductDummy {

	public static void main(String[] args) {
		
		DBUtil util = new DBUtil();
		Random rnd = new Random();
		Connection conn = util.open();
		
		for(int i=1; i<=96; i++) {
			PreparedStatement stat = null;
			for(int j=0; j<rnd.nextInt(8)+5; j++) {
				try {
					String sql = "insert into combiProduct values (seqcombiProduct.nextVal, ?,?, default)";
					stat = conn.prepareStatement(sql);
					
					stat.setInt(1, i);
					stat.setInt(2, rnd.nextInt(891)+1);
					
					stat.executeUpdate();
					stat.close();
					System.out.println(">>> insert complete");
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
