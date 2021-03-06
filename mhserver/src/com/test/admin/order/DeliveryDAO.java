package com.test.admin.order;

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

/**
 * @author ks008
 * Delivery테이블(뷰)에 접근하기 위한 객체입니다.
 */
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
	
	/**
	 * @author ks008
	 * 주문번호를 검색하는 메소드입니다.
	 */
	public ArrayList<DeliveryDTO> order(String seq) {
		
		try {
			
			String sql = "select * from vwdelivery where order_seq = ? order by delivery_regdate desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<DeliveryDTO> order = new ArrayList<DeliveryDTO>();
			
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
				
				order.add(dto);
			}
			
			return order;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
		
	}
	
	/**
	 * @author ks008
	 * 기간으로만 검색하는 메소드입니다.
	 */
	public ArrayList<DeliveryDTO> date(HashMap<String, String> map) {
		
		try {
			
			String sql = "select * from vwdelivery where delivery_regdate between ? and ? order by delivery_regdate desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("begin"));
			pstat.setString(2, map.get("end"));
			
			rs = pstat.executeQuery();
			
			ArrayList<DeliveryDTO> date = new ArrayList<DeliveryDTO>();
			
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
				
				date.add(dto);
			}
			
			return date;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	/**
	 * @author ks008
	 * 상품명으로만 검색하는 메소드입니다.
	 */
	public ArrayList<DeliveryDTO> name(String product) {
		
		try {
			
			String sql = "select * from vwdelivery where product_name like '%%' || ? || '%%' order by delivery_regdate desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, product);
			
			rs = pstat.executeQuery();
			
			ArrayList<DeliveryDTO> name = new ArrayList<DeliveryDTO>();
			
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
				
				name.add(dto);
			}
			
			return name;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	/**
	 * @author ks008
	 * 분류별로 검색하는 메소드입니다.
	 */
	public ArrayList<DeliveryDTO> category(String category) {

		try {
			
			String sql = "select * from vwdelivery where delivery_category = ? order by delivery_regdate desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, category);
			
			rs = pstat.executeQuery();
			
			ArrayList<DeliveryDTO> name = new ArrayList<DeliveryDTO>();
			
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
				
				name.add(dto);
			}
			
			return name;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

}