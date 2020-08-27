package com.test.admin.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;
import com.test.user.main.MemberDTO;

public class ClientDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ClientDAO() {
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

	public ArrayList<MemberDTO> getClientlist(String word, int flag, HashMap<String, String> map) {

		try {
			String sql = "select * from(select a.*,rownum as rnum from(select * from member where ";
			if (word.length() > 0) {
				if (flag == 0) {
					sql += "name like '%' || ? || '%' ";
				} else if (flag == 1) {
					sql += "address like '%' || ? || '%' ";
				} else if (flag == 2) {
					sql += "email like '%' || ? || '%' ";
				} else if (flag == 3) {
					sql += "tel like '%' || ? || '%' ";
				}
				sql += "order by seq desc)";
			}
			sql += " a) where rnum >= ? and rnum <= ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, word);
			pstat.setString(2, map.get("begin"));
			pstat.setString(3, map.get("end"));
			rs = pstat.executeQuery();

			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getInt("gender") == 1 ? "남자" : rs.getInt("gender") == 2 ? "여자" : "선택안함");
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setGradeseq(rs.getInt("gradeseq") == 1 ? "MEMBER"
						: rs.getInt("gradeseq") == 2 ? "BRONZE"
								: rs.getInt("gradeseq") == 3 ? "SILVER"
										: rs.getInt("gradeseq") == 4 ? "GOLD"
												: rs.getInt("gradeseq") == 5 ? "PLATINUM" : "DIAMOND");
				dto.setAddress(rs.getString("address"));
				dto.setBirth(rs.getString("birth").substring(0, 10));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public int getTotalCount(String word, int flag) {
		try {
			String sql = "select count(*) as cnt from member where ";
			if(word.length() > 0) {
				if(flag == 0) { sql += "name = ?"; }
				else if(flag == 1) {sql += "address like '%' || ? || '%'";}
				else if(flag == 2) {sql += "email = ?";}
				else if(flag == 3) {sql += "tel = ?";}
			}
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, word);
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
