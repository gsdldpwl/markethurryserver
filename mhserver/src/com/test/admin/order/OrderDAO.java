package com.test.admin.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;
import com.test.user.main.MemberDTO;

public class OrderDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public OrderDAO() {
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

	public ArrayList<OrderListDTO> getOrderlist(String word, String startdate, String enddate, int flag, HashMap<String, String> map) {
		try {
			boolean wordflag = false;
			if(word.length()>0) {wordflag = true;}
			boolean dateflag = false;
			if(startdate.length()>0) {dateflag = true;}
			
			String sql = "select ol.seq as seq, ol.regdate as regdate, (select id from member where seq=ol.memberseq) as id, ol.price as price, p.name as pname, p.category as category, od.qty  as qty from orderlist ol inner join orderdetail od on ol.seq = od.orderseq inner join product p on p.seq = od.productseq where ol.delflag = 0 and ";
			// 검색어 O, 기간 X
			if(wordflag) {
				if(flag==0) {sql += "memberseq in (select seq from member where id like '%' || ? || '%')";}
				else if(flag==1) {sql = "select od.orderseq as seq from orderdetail od inner join product p on p.seq=od.productseq where od.delflag = 0 and p.name like '%' || ? || '%'";}
				
				if(dateflag) {
					sql += " and ol.regdate >= ? and ol.regdate <= ?";
				}
			} else if(dateflag) {
				sql += "ol.regdate >= ? and ol.regdate <= ?";
			} 
			pstat = conn.prepareStatement(sql);
			
			if(wordflag == true && dateflag == false) {
				pstat.setString(1, word);
			} else if(wordflag == false && dateflag == true) {
				pstat.setString(1, startdate);
				pstat.setString(2, enddate);
			} else if(wordflag == true && dateflag == true) {
				pstat.setString(1, word);
				pstat.setString(2, startdate);
				pstat.setString(3, enddate);
			}
			
			rs = pstat.executeQuery();
			
			ArrayList<OrderListDTO> list = new ArrayList<OrderListDTO>();
			while(rs.next()) {
				OrderListDTO ol = new OrderListDTO();
				
				ol.setSeq(rs.getString("seq"));
				ol.setRegdate(rs.getString("regdate").substring(0,10));
				ol.setPrice(rs.getString("price"));
				ol.setName(rs.getString("pname"));
				ol.setCategory(rs.getString("category"));
				ol.setQty(rs.getString("qty"));
				
				list.add(ol);
			}
			
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
