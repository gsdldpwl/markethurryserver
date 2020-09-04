package com.test.user.main;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import com.test.user.main.DBUtil;

/**
 * @author leeho 사용자의 데이터를 가져오기 위한 DAO 객체
 */
public class MemberDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	/**
	* 데이터베이스 연결
	*/
	public MemberDAO() {

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
	 * @param dto : 로그인 시도 시 입력한 id,pw 를 담은 객체
	 * @return 로그인 성공 여부
	 */
	public int loginCheck(MemberDTO dto) {

		try {
			String sql = "select pw from member where id=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());

			rs = pstat.executeQuery();
			if (rs.next()) {
				if (rs.getString("pw").equals(dto.getPw())) {
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

	public MemberDTO setinfo(String memberseq) {
		try {
			String sql = "select * from member where seq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberseq);

			rs = pstat.executeQuery();
			MemberDTO dto = new MemberDTO();

			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setGradeseq(rs.getString("gradeseq"));
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

}