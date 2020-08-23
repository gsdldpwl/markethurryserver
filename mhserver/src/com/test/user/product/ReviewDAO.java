package com.test.user.product;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.test.user.main.DBUtil;

public class ReviewDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ReviewDAO() {
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

	public int plusReviewCount(String reviewSeq) {
		
		
		try {
			String sql = "update review set readcount = readcount + 1 where seq = ?";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, reviewSeq);
			int result = pstat.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	
	

	public ReviewDTO getdeliveryinfo(String seq) {
		
		try {
			
			String sql = "select d.orderseq as orderseq, d.status as status, d.deliverycomplete as deliverycomplete, o.memberseq as mseq, od.productseq as pseq " + 
					"from delivery d " + 
					"    inner join orderlist o " + 
					"        on d.orderseq = o.seq" + 
					"            inner join orderdetail od" + 
					"                on o.seq = od.orderseq" + 
					"                    where d.status = 2" + 
					"                        and od.productseq = ?" + 
					"                            and o.memberseq = ?" + 
					"                                and sysdate < d.deliverycomplete + 30";
			
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setString(2, "529");
			
			rs = pstat.executeQuery();
	        if(rs.next()) {
	        	 
	        	ReviewDTO rdto = new ReviewDTO();
	        	 
	        	//...?
	        	rdto.setOrderseq(rs.getString("orderseq"));
	        	rdto.setStatus(rs.getString("status"));
	        	rdto.setDeliverycomplete(rs.getString("deliverycomplete"));
	        	rdto.setMemberseq(rs.getString("mseq"));
	        	rdto.setProductseq(rs.getString("pseq"));
	            
				return rdto;
	        }
			
	         
			
		} catch (Exception e) {
			System.out.println("ReviewDAO.getdeliveryinfo()");
			e.printStackTrace();
		}
		
		return null;
	}
}
