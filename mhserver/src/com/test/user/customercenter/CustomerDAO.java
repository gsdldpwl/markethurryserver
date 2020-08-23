package com.test.user.customercenter;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;

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

	
	//notice (공지사항) 조회수 증가
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
	
	
	//notice 서블릿 -> 글번호를 주고 게시물 1개를 반환받기 위해 위임
	public CustomerDTO get(CustomerDTO dto2) {
		
		try {
			
			String sql = "select title, regdate, readcount, content from notice where seq=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto2.getSeq()); //글번호
//			pstat.setString(2, dto2.getSeq());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				CustomerDTO dto = new CustomerDTO();
				
//				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
//				dto.setMseq(rs.getString("mseq"));
//				
//				dto.setName(rs.getString("name"));
//				dto.setId(rs.getString("id"));
				
				return dto;				
			}

		} catch (Exception e) {
			System.out.println("CustomerDAO.get()");
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	
	
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
	
	//게시판 목록
	public ArrayList<CustomerDTO> list(HashMap<String, String> map) {
		
		try {
			
			//목록 or 검색
//			String where = "";
//			
//			if (map.get("search") != null) {
//				//이름 & 제목 & 내용 - 포괄 검색
//				where = String.format("and (title like '%%%s%%' or content like '%%%s%%')", map.get("search"), map.get("search"));
//			}
			
//			String temp = "select * from (select a.*, rownum as rnum from (select * from vwBoard order by thread desc) a) where rnum >= 1 and rnum <= 20 %s order by %s desc";

			String sql = String.format("select seq, title, regdate, readcount from (select a.*, rownum as rnum from (select * from notice order by seq desc) a) where rnum >= %s and rnum <= %s order by seq desc", map.get("begin"), map.get("end"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<CustomerDTO> list = new ArrayList<CustomerDTO>();
			
			//rs -> list 복사
			while (rs.next()) {
				//레코드 1줄 -> BoardDTO 1개
				CustomerDTO dto = new CustomerDTO();
				
				dto.setSeq(rs.getString("seq"));
//				dto.setHeart(rs.getInt("heart"));
				dto.setTitle(rs.getString("title"));
//				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				
//				dto.setGap(rs.getInt("gap"));
				
//				dto.setCommentcount(rs.getInt("commentcount"));
				
//				dto.setDepth(rs.getInt("depth"));
				
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
