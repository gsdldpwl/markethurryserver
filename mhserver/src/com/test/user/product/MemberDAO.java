package com.test.user.product;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.user.main.DBUtil;

public class MemberDAO {

   private Connection conn;
   private Statement stat;
   private PreparedStatement pstat;
   private ResultSet rs;

	  public MemberDAO() {
	  
	  DBUtil util = new DBUtil(); conn = util.open();
	  
	  }
	 
   
   public void close() {
      try {
         conn.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public int loginCheck(MemberDTO dto) {
      
      try {
         String sql = "select pw from member where id=?";
         pstat = conn.prepareStatement(sql);
         pstat.setString(1, dto.getId());
         
         rs = pstat.executeQuery();
         if(rs.next()) {
            if(rs.getString("pw").equals(dto.getPw())) {
               return 1;
            } else {
               return 0;
            }
         } 
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return 0;
   }

   public MemberDTO setinfo(MemberDTO dto) {
      try {
         String sql = "select * from member where id=?";
         pstat = conn.prepareStatement(sql);
         pstat.setString(1, dto.getId());
         
         rs = pstat.executeQuery();
         if(rs.next()) {
            dto.setSeq(rs.getString("seq"));
            dto.setId(rs.getString("id"));
            dto.setName(rs.getString("name"));
            dto.setEmail(rs.getString("email"));
            dto.setTel(rs.getString("tel"));
            dto.setGradeseq("gradeseq");
            dto.setAddress(rs.getString("address"));
            dto.setBirth(rs.getString("birth"));
            dto.setGender(rs.getString("gender"));
            
         }
         return dto;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }


	public MemberDTO getper(String mseq) {
		
		try {
	         String sql = "select id, gradeseq from member where seq = ?";
	         
	         pstat = conn.prepareStatement(sql);
	         pstat.setString(1, mseq);
	         
	         rs = pstat.executeQuery();
	         if(rs.next()) {
	        	 
	        	MemberDTO mdto = new MemberDTO();
	        	 
				mdto.setId(rs.getString("id"));
				mdto.setGradeseq(rs.getString("gradeseq"));
	            
				return mdto;
	         }
	         
	      } catch (Exception e) {
	    	  System.out.println("MemberDAO.getper()");
	         e.printStackTrace();
	      }
		
		
		return null;
	}
}