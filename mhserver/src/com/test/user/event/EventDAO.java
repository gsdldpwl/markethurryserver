package com.test.user.event;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;

import com.test.user.main.DBUtil;
import com.test.user.product.ProductDTO;

public class EventDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public EventDAO() {
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

	//event서블릿 -> 이미지 링크
	public ArrayList<EventDTO> img() {

		try {

			String sql = "select seq, image from event where seq >= 106";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<EventDTO> list = new ArrayList<EventDTO>();

			// rs -> list 복사
			while (rs.next()) {
				// 레코드 1줄 -> dto 1개
				EventDTO dto = new EventDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setImg(rs.getString("image"));

				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}
	
	//eventlist 서블릿 -> 이벤트 제목
	public String title(String seq) {
		
		try {
			
			String sql = "select title from event where seq = ?";
			
			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();
			
			EventDTO dto = new EventDTO();
			
			while (rs.next()) {
				
				dto.setTitle(rs.getString("title"));
				
			}
			
			return dto.getTitle();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
		
	}

	//eventlist 서블릿 -> 이벤트 상품 목록
	public ArrayList<ProductDTO> list(String seq) {

		// 가격 세자리수 소수점 표기
		DecimalFormat formatter = new DecimalFormat("###,###");

		try {

			String sql = "select p.seq, p.img, p.name, p.price, p.shortdesc from eventproduct ep, product p, event e where ep.productseq = p.seq and e.seq = ep.eventseq and e.seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

			// rs -> list 복사
			while (rs.next()) {
				// 레코드 1줄 -> dto 1개
				ProductDTO dto = new ProductDTO();
 
				dto.setSeq(rs.getString("seq"));
				dto.setImg(rs.getString("img")); 
				dto.setName(rs.getString("name"));
				dto.setPrice(formatter.format(rs.getInt("price")));
				dto.setShortdesc(rs.getString("shortdesc"));

				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

}