package com.test.user.product;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;

public class OrderPageDAO {

	private Connection conn;
	   private Statement stat;
	   private PreparedStatement pstat;
	   private ResultSet rs;
	         
	   public OrderPageDAO() {
	   //DB연결
	            
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
	   
	   
	   
	   //OrderPage 서블릿 -> 주문서 들어갈 회원정보 주세요.
	   public ArrayList<OrderPageDTO>  memlist(String memseq) {
	      
	      
	      try {
	         
	        String sql ="select mem.seq as MemberSeq,mem.name as MemberName, mem.tel as MemberTel, mem.email as MemberEmail, mem.address as MemberAddress, mil.price as MemberMileage from member mem  inner join mileage mil on mil.memberseq = mem.seq";

//	        pstat = conn.prepareStatement(sql);
//	        
//			pstat.setString(1, memseq);
			
			stat = conn.createStatement();
	         
	         rs = stat.executeQuery(sql);
	         
	         ArrayList<OrderPageDTO> memlist = new ArrayList<OrderPageDTO>();
	         
	         
	         //rs -> list 복사
	         while (rs.next()) {
	            //이때 도는 레코드 1줄이 -> ProduclistDTO 1개
	        	 OrderPageDTO dto = new OrderPageDTO();
	            dto.setMemseq(rs.getString("memseq"));
	            dto.setMemname(rs.getString("memname"));
	            dto.setMemtel(rs.getString("memtel"));
	            dto.setMememail(rs.getString("mememail"));
	            dto.setMemaddress(rs.getString("memaddress"));
	            dto.setMemmile(rs.getString("memmile"));
	            
	            
	            memlist.add(dto);
	            
	            
	         }
	         
	      
	         return memlist;
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	   }
	   
}//class
