package com.test.user.customercenter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.NumberFormat;
import java.util.ArrayList;

import com.test.user.main.DBUtil;

/**
 * @author leeho
 * 고객센터 메뉴 관련 DAO
 */
public class CustomercenterDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	/**
	 * 데이터베이스 연결
	 */
	public CustomercenterDAO() {

		DBUtil util = new DBUtil();
		conn = util.open();

	}

	/**
	 * 데이터베이스 연결 종료
	 */
	public void close() {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param seq : 사용자 seq
	 * @return 일치하는 1:1문의 DTO를 담은 arraylist
	 */
	public ArrayList<OnebyoneDTO> getOBOList(String seq) {

		try {

			String sql = "select * from oneonone where memberseq = ? and delflag=0";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();
			ArrayList<OnebyoneDTO> list = new ArrayList<OnebyoneDTO>();

			while (rs.next()) {
				OnebyoneDTO dto = new OnebyoneDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setOrderseq(rs.getString("orderseq"));
				dto.setCategory(rs.getString("category").equals("1") ? "교환문의" : "환불문의");
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFilepath(rs.getString("filepath"));
				dto.setInquirydate(rs.getString("inquirydate").substring(0, 10));
				dto.setAnswercontent(rs.getString("answercontent"));
				dto.setAnswerdate(rs.getString("answerdate"));

				list.add(dto);
			}

			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * @param seq : 사용자 seq
	 * @return seq와 일치하는 1:1 DTO
	 */
	public OnebyoneDTO get(String seq) {

		try {

			String sql = "select * from oneonone where seq = ? and delflag=0";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();
			

			OnebyoneDTO dto = new OnebyoneDTO();
			if (rs.next()) {

				dto.setSeq(rs.getString("seq"));
				dto.setOrderseq(rs.getString("orderseq"));
				dto.setCategory(rs.getString("category").equals("1") ? "교환문의" : "환불문의");
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFilepath(rs.getString("filepath"));
				dto.setInquirydate(rs.getString("inquirydate") != null ? rs.getString("inquirydate").substring(0, 10) : "");
				dto.setAnswercontent(rs.getString("answercontent"));
				dto.setAnswerdate(rs.getString("answerdate") != null ? rs.getString("answerdate").substring(0, 10) : "");
				
			}
			return dto;

			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * @param seq : 사용자 seq
	 * @return 사용자가 구매했던 주문 DTO를 담은 arraylist
	 */
	public ArrayList<OnebyoneInquiryDTO> getOBOOrderlist(String seq) {
		
		try {
			String sql = "select ol.seq as olseq, ol.regdate as olregdate, ol.price as price, (select name from product where seq = od.productseq) as pname, qty  from orderlist ol inner join orderdetail od on ol.seq = od.orderseq where memberseq = ? and ol.delflag = 0 and od.delflag=0 order by regdate desc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			ArrayList<OnebyoneInquiryDTO> list = new ArrayList<OnebyoneInquiryDTO>();			
			while(rs.next()) {
				OnebyoneInquiryDTO dto = new OnebyoneInquiryDTO();
				dto.setSeq(rs.getString("olseq"));
				dto.setRegdate(rs.getString("olregdate").substring(0,10));
				dto.setPrice(NumberFormat.getInstance().format(rs.getInt("price")));
				dto.setPname(rs.getString("pname"));
				dto.setQty(rs.getString("qty"));
				
				list.add(dto);
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return null;
	}

	/**
	 * @param category : 1:1문의 종류
	 * @param orderseq : 주문번호
	 * @param content : 내용
	 * @param mseq : 멤버 seq 
	 * @param title : 제목
	 * @return 작성 성공 여부
	 */
	public int insertOBOInquiry(String category, String orderseq, String content, String mseq, String title) {
		
		try {
			String sql = "insert into oneonone (seq,memberseq,orderseq,category,title,content,inquirydate) values (seqoneonone.nextVal,?,?,?,?,?,default)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mseq);
			pstat.setString(2, orderseq);
			pstat.setString(3, category);
			pstat.setString(4, title);
			pstat.setString(5, content);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
