package com.test.user.product;

import java.sql.CallableStatement;
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
	   private CallableStatement cstat;
	         
	   //DB연결
	            
	   public OrderPageDAO()	{
		   
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
	   
	   
	   
	 //OrderPage 서블릿 -> 주문서 들어갈 회원정보 주세요. (마일리지 있는 회원)
	   public OrderPageDTO  memlist(String mseq) {
	      
	      try {
	    	 
	        //String sql ="select mem.seq as MemberSeq,mem.name as MemberName, mem.tel as MemberTel, mem.email as MemberEmail, mem.address as MemberAddress, mil.price as MemberMileage from member mem  inner join mileage mil on mil.memberseq = mem.seq where memberseq = ?";
	        String sql ="select seq,name,tel,email,address from member where seq = ?";
	        //String sql ="call proc_nowmileage(?,?)";

	        pstat = conn.prepareStatement(sql);
			pstat.setString(1, mseq);
			//pstat.setString(2, mseq);
			
			//stat = conn.createStatement();
	         
	        rs = pstat.executeQuery();
	         
	         
	         //rs -> list 복사
	         OrderPageDTO dto = new OrderPageDTO();
	         if (rs.next()) {
	            //이때 도는 레코드 1줄이 -> ProduclistDTO 1개
	            dto.setMemseq(rs.getString("seq"));
	            dto.setMemname(rs.getString("name"));
	            dto.setMemtel(rs.getString("tel"));
	            dto.setMememail(rs.getString("email"));
	            dto.setMemaddress(rs.getString("address"));
	            
	            return dto;
	            
	         }
	         
	      
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	   }

	   
	   
	   
	//주문하기 결제 버튼 클릭 후 주문 테이블에 데이터 보내기
	   public int odtable(String mseq,String finalprice,OrderPageDTO dto2) {
		   
		   try {
			
			   String sql = "insert into orderlist (seq, memberseq, regdate, price,delflag) values (seqorderlist.nextVal,?,sysdate,?,0)";
			   
			   
			   pstat = conn.prepareStatement(sql);
			   pstat.setString(1, mseq);
			   pstat.setString(2,finalprice);
			   
			   return pstat.executeUpdate();
				
				 
		} catch (Exception e) {
			e.printStackTrace();
		}
		   return 0;
	   }

	   
	   
	   
	//주문하기 결제 버튼 클릭 후 주문상세 테이블에 데이터 보내기   
	public int oddttable(String[] productseq,String[] orpdqty) {
		
		
		try {
			String sql = "insert into orderdetail (seq, productseq, orderseq, qty,delflag) values (seqorderdetail.nextVal,?,(select max(seq) from orderlist),?,0)";
			int result = 0;
			 pstat = conn.prepareStatement(sql);
			 for(int i=0; i<productseq.length; i++	) {
				 pstat.setString(1, productseq[i]);
				 pstat.setString(2, orpdqty[i]);
				 
				 result += pstat.executeUpdate();
				 
			 }
				
			 return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	   
	

	
	   
}//class
