package com.test.user.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.test.user.main.DBUtil;

/**
 * @author leeho
 * 장바구니 DAO
 */
public class ShoppingbasketDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	/**
	 * 데이터베이스 연결
	 */
	public ShoppingbasketDAO() {

		DBUtil util = new DBUtil();
		conn = util.open();

	}

	/**
	 * 데이터베이스 연결 종료
	 */
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/** 사용자의 상품  갯수 + 1;
	 * @param mseq : 사용자 seq
	 * @param pseq : 선택 상품seq
	 */
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
	
	/** 사용자의 상품  갯수 - 1;
	 * @param mseq : 사용자 seq
	 * @param pseq : 선택 상품seq
	 */
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
	
	/**사용자의 상품 삭제
	 * @param mseq : 사용자 seq 
	 * @param selectedSeq : 선택된 상품 list
	 */
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
