package com.test.admin.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/admin/order/deliveryok.do")
public class DeliveryOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  //검색 
		  req.setCharacterEncoding("UTF-8");
		
		  String seq = req.getParameter("seq"); 
		  String begin = req.getParameter("begin"); 
		  String end = req.getParameter("end"); 
		  String product = req.getParameter("product"); 
		  String category = req.getParameter("category");
		  
		  //기간
		  HashMap<String,String> map = new HashMap<String,String>();
		  map.put("begin", begin);
		  map.put("end", end);
		  
		  //주문번호, 기간(시작, 끝), 상품명 
//		  HashMap<String,String> map2 = new HashMap<String,String>();
//		  map2.put("seq", seq);
//		  map2.put("begin", begin);
//		  map2.put("end", end);
//		  map2.put("product", product);
		  
		  //주문번호, 기간(시작, 끝), 분류별 
		  //HashMap<String,String> map2 = new HashMap<String,String>(); 
		  //map2.put("seq", seq);
		  //map2.put("begin", begin);
		  //map2.put("end", end); 
		  //map2.put("category", category);
		  
		  //DB작업 
		  DeliveryDAO dao = new DeliveryDAO();
		  
		  JSONArray arr = new JSONArray();
		  
		  if (seq != null && begin == null && end == null && product == null && category == null) {
			  //주문번호로 검색
			  ArrayList<DeliveryDTO> order = dao.order(seq);
			  
			  dao.close();
			  for (DeliveryDTO dto : order) {
				  
				  JSONObject obj = new JSONObject();
				  
				  obj.put("delivery_category", (Integer.parseInt(dto.getDelivery_category()) == 0) ? "판매" : 
					  						   (Integer.parseInt(dto.getDelivery_category()) == 1) ? "교환(고객)" : 
					  						   (Integer.parseInt(dto.getDelivery_category()) == 2) ? "교환(업체)" : 
					  						   (Integer.parseInt(dto.getDelivery_category()) == 3) ? "환불" : "null");
				  obj.put("order_regdate", dto.getOrder_regdate().substring(0, 10));
				  obj.put("order_seq", dto.getOrder_seq());
				  obj.put("order_name", dto.getOrder_name());
				  obj.put("product_name", dto.getProduct_name());
				  obj.put("product_qty", dto.getProduct_qty());
				  obj.put("order_price", dto.getOrder_price());
				  obj.put("delivery_status", (Integer.parseInt(dto.getDelivery_status()) == 0) ? "배송준비 중" :
					  						 (Integer.parseInt(dto.getDelivery_status()) == 1) ? "배송 중" :
					  						 (Integer.parseInt(dto.getDelivery_status()) == 2) ? "배송완료" : "null");
				  obj.put("delivery_regdate", dto.getDelivery_regdate().substring(0, 10));
				  
				  arr.add(obj);
				  
			  }//for
			  
		  } else if (seq == null && begin != null && end != null && product == null && category == null) {
			  //기간으로 검색
			  ArrayList<DeliveryDTO> date = dao.date(map);
			  dao.close();
			  
			  for (DeliveryDTO dto : date) {
				  
				  JSONObject obj = new JSONObject();
				  
				  obj.put("delivery_category", (Integer.parseInt(dto.getDelivery_category()) == 0) ? "판매" : 
											   (Integer.parseInt(dto.getDelivery_category()) == 1) ? "교환(고객)" : 
											   (Integer.parseInt(dto.getDelivery_category()) == 2) ? "교환(업체)" : 
											   (Integer.parseInt(dto.getDelivery_category()) == 3) ? "환불" : "null");
				  obj.put("order_regdate", dto.getOrder_regdate().substring(0, 10));
				  obj.put("order_seq", dto.getOrder_seq());
				  obj.put("order_name", dto.getOrder_name());
				  obj.put("product_name", dto.getProduct_name());
				  obj.put("product_qty", dto.getProduct_qty());
				  obj.put("order_price", dto.getOrder_price());
				  obj.put("delivery_status", (Integer.parseInt(dto.getDelivery_status()) == 0) ? "배송준비 중" :
											 (Integer.parseInt(dto.getDelivery_status()) == 1) ? "배송 중" :
											 (Integer.parseInt(dto.getDelivery_status()) == 2) ? "배송완료" : "null");
				  obj.put("delivery_regdate", dto.getDelivery_regdate().substring(0, 10));
				  
				  arr.add(obj);
				  
			  }//for
			  
		  } else if (seq == null && begin == null && end == null && product != null && category == null) {
			  //상품명으로 검색
			  ArrayList<DeliveryDTO> name = dao.name(product);
			  dao.close();
			  
			  for (DeliveryDTO dto : name) {
				  
				  JSONObject obj = new JSONObject();
				  
				  obj.put("delivery_category", (Integer.parseInt(dto.getDelivery_category()) == 0) ? "판매" : 
											   (Integer.parseInt(dto.getDelivery_category()) == 1) ? "교환(고객)" : 
											   (Integer.parseInt(dto.getDelivery_category()) == 2) ? "교환(업체)" : 
											   (Integer.parseInt(dto.getDelivery_category()) == 3) ? "환불" : "null");
				  obj.put("order_regdate", dto.getOrder_regdate().substring(0, 10));
				  obj.put("order_seq", dto.getOrder_seq());
				  obj.put("order_name", dto.getOrder_name());
				  obj.put("product_name", dto.getProduct_name());
				  obj.put("product_qty", dto.getProduct_qty());
				  obj.put("order_price", dto.getOrder_price());
				  obj.put("delivery_status", (Integer.parseInt(dto.getDelivery_status()) == 0) ? "배송준비 중" :
											 (Integer.parseInt(dto.getDelivery_status()) == 1) ? "배송 중" :
											 (Integer.parseInt(dto.getDelivery_status()) == 2) ? "배송완료" : "null");
				  obj.put("delivery_regdate", dto.getDelivery_regdate().substring(0, 10));
				  
				  arr.add(obj);
				  
			  }//for
			  
		  } else if (seq == null && begin == null && end == null && product == null && category != null) {			  
			  //dao에 넣기 전 삼항연산자로 변환
			  category = (category.equals("판매")) ? "0" :
				  		 (category.equals("고객")) ? "1" :
				  		 (category.equals("업체")) ? "2" :
				  		 (category.equals("환불")) ? "3" : null;
			  
			  //분류별로 검색
			  ArrayList<DeliveryDTO> cate = dao.category(category);
			  
			  dao.close();
			  
			  for (DeliveryDTO dto : cate) {
				  
				  JSONObject obj = new JSONObject();
				  
				  obj.put("delivery_category", (Integer.parseInt(dto.getDelivery_category()) == 0) ? "판매" : 
											   (Integer.parseInt(dto.getDelivery_category()) == 1) ? "교환(고객)" : 
											   (Integer.parseInt(dto.getDelivery_category()) == 2) ? "교환(업체)" : 
											   (Integer.parseInt(dto.getDelivery_category()) == 3) ? "환불" : "null");
				  obj.put("order_regdate", dto.getOrder_regdate().substring(0, 10));
				  obj.put("order_seq", dto.getOrder_seq());
				  obj.put("order_name", dto.getOrder_name());
				  obj.put("product_name", dto.getProduct_name());
				  obj.put("product_qty", dto.getProduct_qty());
				  obj.put("order_price", dto.getOrder_price());
				  obj.put("delivery_status", (Integer.parseInt(dto.getDelivery_status()) == 0) ? "배송준비 중" :
											 (Integer.parseInt(dto.getDelivery_status()) == 1) ? "배송 중" :
											 (Integer.parseInt(dto.getDelivery_status()) == 2) ? "배송완료" : "null");
				  obj.put("delivery_regdate", dto.getDelivery_regdate().substring(0, 10));
				  
				  arr.add(obj);
				  
			  }//for
			  
		  }//if
		  
		  resp.setCharacterEncoding("UTF-8");
		  resp.setContentType("application/json");
		  
		  PrintWriter writer = resp.getWriter();
		  
		  writer.print(arr);
		  writer.close();
		
	}
	
}