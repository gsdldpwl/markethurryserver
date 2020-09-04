package com.test.user.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;

import com.test.user.main.DBUtil;

/**
 * @author ks008
 * product테이블에 접근하기 위한 객체입니다.
 */
public class HotProductDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public HotProductDAO() {
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
	 * @author ks008
	 * 인기상품을 조회하는 메소드입니다.
	 */
	public ArrayList<ProductDTO> Hotlist() {
		
		DecimalFormat formatter = new DecimalFormat("###,###");

		try {
			
			String sql = "select a.*, rownum as rnum from (select distinct p.seq as seq, p.name as name, p.img as img, p.price as price, p.shortdesc as shortdesc, (select count(*) from orderdetail where productseq = od.productseq) as cnt from product p, orderdetail od where p.seq = od.productseq order by cnt desc)a where rownum <= 30";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			
			while (rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
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