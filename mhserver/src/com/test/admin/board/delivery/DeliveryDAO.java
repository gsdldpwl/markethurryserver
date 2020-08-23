package com.test.admin.board.delivery;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;
import com.test.user.event.EventDTO;

public class DeliveryDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public DeliveryDAO() {
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
	
	//주문번호, 기간(시작, 끝), 상품명 검색
	public ArrayList<DeliveryDTO> list(HashMap<String, String> map) {
		
		try {
			//주문번호, 기간(시작, 끝), 상품명 - 포괄 검색
			
			if (map.get("seq") != null && map.get("begin") != null && map.get("end") != null && map.get("name") != null) {
				String sql = String.format("select * from vwdelivery where order_seq = %d and product_name like '%%%s%%' and delivery_regdate between '%s' and '%s'", Integer.parseInt(map.get("seq")), map.get("name"), map.get("begin"), map.get("end"));
				
				stat = conn.createStatement();
				rs = stat.executeQuery(sql);
				
				System.out.println(sql);
				
				ArrayList<DeliveryDTO> list = new ArrayList<DeliveryDTO>();
				
				//rs -> list 복사
				while (rs.next()) {
					//레코드 1줄 -> DeliveryDTO 1개
					DeliveryDTO dto = new DeliveryDTO();
					
					dto.setOrder_regdate(rs.getString("order_regdate"));
					dto.setOrder_seq(rs.getString("order_seq"));
					dto.setOrder_name(rs.getString("order_name"));
					dto.setProduct_name(rs.getString("product_name"));
					dto.setProduct_qty(rs.getString("product_qty"));
					dto.setOrder_price(String.format("%,d", rs.getInt("order_price")));
					dto.setDelivery_category(rs.getString("delivery_category"));
					dto.setDelivery_status(rs.getString("delivery_status"));
					dto.setDelivery_regdate(rs.getString("delivery_regdate"));
					
					list.add(dto);
					
				}//while
				
				return list;
				
			}//if
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

}