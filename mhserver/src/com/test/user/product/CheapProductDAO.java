package com.test.user.product;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;

import com.test.user.main.DBUtil;

public class CheapProductDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public CheapProductDAO() {
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

	public ArrayList<CheapProductDTO> Cheaplist() {
		
		DecimalFormat formatter = new DecimalFormat("###,###");

		try {
			
			String sql = "select a.*, rownum as rnum from (select distinct p.seq as seq, p.name as name, p.img as img, p.price as price, p.shortdesc as shortdesc, (select count(*) from orderdetail where productseq = od.productseq) as cnt from product p, orderdetail od where p.seq = od.productseq order by cnt asc)a where rownum <= 30";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<CheapProductDTO> list = new ArrayList<CheapProductDTO>();
			
			while (rs.next()) {
				
				CheapProductDTO dto = new CheapProductDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));
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