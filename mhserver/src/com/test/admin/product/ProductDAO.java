package com.test.admin.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;

public class ProductDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ProductDAO() {
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
	
	// 관리자, 상품조회
		public ArrayList<ProductDTO> searchproduct(HashMap<String, String> map) {
			
			try {
				
				if (map.get("search") != null) {
					//이름 & 제목 & 내용 - 포괄 검색
					//String sql = String.format("select seq, name, regdate, category, price from (select a.*, rownum as rnum from (select * from product where seq like '%%' || ? || '%%' or name like '%%' || ? || '%%' order by seq asc) a) where rnum >= %s and rnum <= %s order by seq desc", map.get("begin"),map.get("end"));
					
					String search = map.get("search");
					
					String sql = "select seq, name, regdate, category, price from product where name like '%%" + search + "%%' order by seq asc";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
//					stat = conn.prepareStatement(sql);
//					pstat.setString(1, map.get("search"));
//					//pstat.setString(2, map.get("search"));
//					rs = pstat.executeQuery();
				} else {
					String sql = "select seq, name, regdate, category, price from product order by seq asc";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
				}
				//else {
				
				
				//String sql = String.format("select seq, title, regdate, readcount from (select a.*, rownum as rnum from (select * from product order by seq desc) a) where rnum >= %s and rnum <= %s order by seq desc", map.get("begin"), map.get("end"));
				
//				stat = conn.createStatement();
//				rs = stat.executeQuery(sql);
				
				//}
				
				ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
				
				//rs -> list 복사
				while (rs.next()) {
					//레코드 1줄 -> BoardDTO 1개
					ProductDTO dto = new ProductDTO();
					
					dto.setSeq(rs.getString("seq"));
					dto.setName(rs.getString("name"));
					dto.setRegdate(rs.getString("regdate").substring(0,10));
					dto.setCategory(rs.getString("category"));
					dto.setPrice(rs.getString("price"));
					
					list.add(dto);
				}
				
				return list;
				
			} catch (Exception e) {
				System.out.println("ProductDAO.searchproduct()");
				e.printStackTrace();
			}
			
			
			return null;
		}

}
