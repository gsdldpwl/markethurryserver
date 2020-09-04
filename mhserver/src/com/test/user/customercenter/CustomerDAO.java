package com.test.user.customercenter;


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
 * 고객센터 - 공지사항 관련
 *
 */
public class CustomerDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public CustomerDAO() {
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
	 * 공지사항 조회수 증가
	 * @param 공지사항(글) 번호
	 */
	public void updateReadcount(String seq) {
		
		try {
			
			String sql = "update notice set readcount = readcount + 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("CustomerDAO.updateReadcount()");
			e.printStackTrace();
			
		}
		
		
	}
	
	
	/**
	 * 해당 글 번호를 가진 공지사항을 반환
	 * @param 글 번호
	 * @return 글 제목, 내용, 등록일, 조회수
	 */
	public CustomerDTO get(CustomerDTO dto2) {
		
		try {
			
			String sql = "select title, regdate, readcount, content from notice where seq=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto2.getSeq()); //글번호
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				CustomerDTO dto = new CustomerDTO();
				
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				
				return dto;				
			}

		} catch (Exception e) {
			System.out.println("CustomerDAO.get()");
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	
	
	/**
	 * search로 검색어, begin, end로 페이징
	 * @param map : 검색어를 map형식으로 받음
	 * @return 전달 받은 map 값과 일치하는 조건을 가진 결과값의 수 반환
	 */
	public int getTotalCount(HashMap<String, String> map) {
		
		
		try {
			String where = "";
			
			if (map.get("search") != null) {
				//제목 & 내용 - 포괄 검색
				where = String.format("where (title like '%%%s%%' or content like '%%%s%%')", map.get("search"), map.get("search"));
			}
			
			
			String sql = String.format("select count(*) as cnt from notice %s", where);
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("CustomerDAO.getTotalCount()");
			e.printStackTrace();
			
		}
		
		
		return 0;
	}
	
	
	/**
	 * 게시판 목록과 관련된 메소드
	 * @param map : 검색어, 페이징을 위한 시작 값, 끝 값을 map형식으로 받음
	 * @return 검색어의 유무에 따라 다른 쿼리 실행, 번호, 제목, 등록일, 조회수를 반환
	 */
	public ArrayList<CustomerDTO> list(HashMap<String, String> map) {
		
		try {
			
			if (map.get("search") != null) {
				//이름 & 제목 & 내용 - 포괄 검색
				String sql = String.format("select seq, title, regdate, readcount from (select a.*, rownum as rnum from (select * from notice where title like '%%' || ? || '%%' or content like '%%' || ? || '%%' order by seq desc) a) where rnum >= %s and rnum <= %s order by seq desc", map.get("begin"),map.get("end"));
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, map.get("search"));
				pstat.setString(2, map.get("search"));
				rs = pstat.executeQuery();
			} else {
			
			
			String sql = String.format("select seq, title, regdate, readcount from (select a.*, rownum as rnum from (select * from notice order by seq desc) a) where rnum >= %s and rnum <= %s order by seq desc", map.get("begin"), map.get("end"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			}
			
			ArrayList<CustomerDTO> list = new ArrayList<CustomerDTO>();
			
			//rs -> list 복사
			while (rs.next()) {
				CustomerDTO dto = new CustomerDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {
			System.out.println("CustomerDAO.list()");
			e.printStackTrace();
		}
		
		
		return null;
	}

	

}
