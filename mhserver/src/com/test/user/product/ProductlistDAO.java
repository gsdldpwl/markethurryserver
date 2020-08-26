package com.test.user.product;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;


public class ProductlistDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
		   
	public ProductlistDAO() {
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

	//Productlist 서블릿 -> 상품목록 주세요.
	public ArrayList<ProductlistDTO> list(HashMap<String, String> map) {
		//상품목록 받으러왔습니다.
		
		try {
			
			//String sql = "select * from product";
			String sql =String.format("select * from (select a.*,rownum as rnum from (select * from product where category=%s order by %s )a) where rnum >= %s and rnum <=%s ",map.get("category"),map.get("sort"),map.get("begin"),map.get("end"));
			//String sql =String.format("select * from  product where rnum >= %s and rnum <=%s",map.get("begin"),map.get("end"));
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<ProductlistDTO> list = new ArrayList<ProductlistDTO>();
			
			
			//rs -> list 복사
			while (rs.next()) {
				//이때 도는 레코드 1줄이 -> ProduclistDTO 1개
				 ProductlistDTO dto = new ProductlistDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setShortdesc(rs.getString("shortdesc"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setPrice(rs.getString("price"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setImg(rs.getString("img"));
				dto.setSales(rs.getInt("sales"));
				
				
				list.add(dto);
				
				
			}
			
		
			return list;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	public int getTotalCount(HashMap<String, String> map) {
		 try {
			 //String where ="";
			
			   //if(map.get("seq") != null) {
				   //where =String.format("where (name like '%%%s%%' or  subject like '%%%s%%' or content like '%%%s%%')",map.get("search"),map.get("search"),map.get("search"));
				   
			   //}
								 
			 String sql ="select count(*) as cnt from product where category="+map.get("category");
			 stat = conn.createStatement();
			 rs = stat.executeQuery(sql);
			 
			 if(rs.next()) {
				 return rs.getInt("cnt");
			 }
			 
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<ProductlistDTO> getSearchedList(String search,HashMap<String, Integer> map) {
		
		try {
			String sql = String.format("select * from(select a.* , rownum as rnum from(select * from product where name like '%%' || ? || '%%' or shortdesc like '%%' || ? || '%%' or content like '%%' || ? || '%%')a) where rnum >= %d and rnum <= %d",map.get("begin"),map.get("end"));
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, search);
			pstat.setString(2, search);
			pstat.setString(3, search);
			
			rs = pstat.executeQuery();
			ArrayList<ProductlistDTO> list = new ArrayList<ProductlistDTO>();
			
			while(rs.next()) {
				ProductlistDTO dto = new ProductlistDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setShortdesc(rs.getString("shortdesc"));
				dto.setPrice(NumberFormat.getInstance().format(rs.getInt("price")));
				dto.setImg(rs.getString("img"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	public int getTotalCountOfSearch(String search) {

		try {
			
			String sql = "select count(*) as cnt from product where name like '%' || ? || '%' or shortdesc like '%' || ? || '%' or content like '%' || ? || '%'";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, search);
			pstat.setString(2, search);
			pstat.setString(3, search);
			
			rs = pstat.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<ShoppingbasketDTO> getShoppingbasketlist(String mseq) {
		
		try {
			String sql = "select p.seq as pseq, p.name as name, p.img as img, p.price as price, sc.qty as qty from shoppingcart sc inner join product p on sc.productseq=p.seq where p.delflag = 0 and sc.delflag = 0  and sc.memberseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mseq);
			
			rs = pstat.executeQuery();
			 ArrayList<ShoppingbasketDTO> list = new ArrayList<ShoppingbasketDTO>();
			
			while(rs.next()) {
				ShoppingbasketDTO dto = new ShoppingbasketDTO();
				dto.setSeq(rs.getString("pseq"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));
				dto.setPrice(NumberFormat.getInstance().format(rs.getInt("price")));
				dto.setQty(rs.getString("qty"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public double getSalesPercentage(String mseq) {
		
		try {
			String sql = "select (select discountper from grade where seq = gradeseq) as per from member where seq = ? and delflag=0";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mseq);
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				return rs.getDouble("per") * 0.01;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
}//class
