package com.test.user.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.test.user.main.DBUtil;

public class ShoppingbasketDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ShoppingbasketDAO() {
		// DB연결

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

	public void addQty(String mseq, String pseq ) {
		try {
			String sql = "update shoppingcart set qty = qty+1 where memberseq = ? and productseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mseq);
			pstat.setString(2, pseq);
			
			pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void reduceQty(String mseq,String pseq) {
		try {
			String sql = "update shoppingcart set qty = qty-1 where memberseq = ? and productseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mseq);
			pstat.setString(2, pseq);
			
			pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteProduct(String mseq,String[] selectedSeq) {
		try {
			String sql = "delete from shoppingcart where memberseq = ? and productseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mseq);
			
			for(String seq : selectedSeq) {
				pstat.setString(2, seq);
				pstat.executeUpdate();
				System.out.println(mseq);
				System.out.println(seq);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
