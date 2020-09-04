package com.test.admin.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;

/**
 * @author 이예지
 * 관리자 - 상품관련
 *
 */
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
	
	
	/**
	 * 관리자 - 상품조회에서 검색과 관련된 메소드
	 * @param map : 검색어를 map형식으로 받음
	 * @return 상품번호, 이름, 등록일, 카테고리, 가격을 오름차순 정렬로 반환
	 * 		     검색어 유무에 따라 다른 쿼리를 실행시킴
	 */
	public ArrayList<ProductDTO> searchproduct(HashMap<String, String> map) {

		try {
		
		if (map.get("search") != null) {
			
			String search = map.get("search");
			
			String sql = "select seq, name, regdate, category, price from product where name like '%%" + search + "%%' order by seq asc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
		} else {
			String sql = "select seq, name, regdate, category, price from product order by seq asc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
		}
		
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		//rs -> list 복사
		while (rs.next()) {
			//레코드 1줄 -> BoardDTO 1개
			ProductDTO dto = new ProductDTO();
			
			dto.setSeq(rs.getString("seq"));
			dto.setName(rs.getString("name"));
			dto.setRegdate(rs.getString("regdate").substring(0,10));
			dto.setCategory(rs.getString("category"));
			dto.setPrice(rs.getInt("price"));
			
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
