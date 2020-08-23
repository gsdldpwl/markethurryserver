package com.test.admin.board.delivery;

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

@WebServlet("/admin/board/delivery/deliveryok.do")
public class DeliveryOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  //검색 
		  req.setCharacterEncoding("UTF-8");
		
		  String seq = req.getParameter("seq"); 
		  String begin = req.getParameter("begin"); 
		  String end = req.getParameter("end"); 
		  String name = req.getParameter("name"); 
		  //String category = req.getParameter("category");
		  
		  //주문번호, 기간(시작, 끝), 상품명 
		  HashMap<String,String> map = new HashMap<String,String>();
		  map.put("seq", seq);
		  map.put("begin", begin);
		  map.put("end", end);
		  map.put("name", name);
		  
		  //주문번호, 기간(시작, 끝), 분류별 
		  //HashMap<String,String> map2 = new HashMap<String,String>(); 
		  //map2.put("seq", seq);
		  //map2.put("begin", begin);
		  //map2.put("end", end); 
		  //map2.put("category", category);
		  
		  //DB작업 
		  DeliveryDAO dao = new DeliveryDAO();
		  
		  //주문번호, 기간, 상품명 검색
		  ArrayList<DeliveryDTO> list = dao.list(map);
		  
		  dao.close();
		  
		  resp.setCharacterEncoding("UTF-8");
		  resp.setContentType("application/json");
		  
		  PrintWriter writer = resp.getWriter();
		  
		  String temp = "";
		  
		  temp += "[";
		  
		  for (DeliveryDTO dto : list) {
			  temp += "{";
			  	temp += String.format("\"delivery_category\": \"%s\",", dto.getDelivery_category());
				temp += String.format("\"order_regdate\": \"%s\",", dto.getOrder_regdate().substring(0, 10));
				temp += String.format("\"order_seq\": \"%s\",", dto.getOrder_seq());
				temp += String.format("\"order_name\": \"%s\",", dto.getOrder_name());
				temp += String.format("\"product_name\": \"%s\",", dto.getProduct_name());
				temp += String.format("\"product_qty\": \"%s\",", dto.getProduct_qty());
				temp += String.format("\"order_price\": \"%s\",", dto.getOrder_price());
				temp += String.format("\"delivery_status\": \"%s\",", dto.getDelivery_status());
				temp += String.format("\"delivery_regdate\": \"%s\"", dto.getDelivery_regdate().substring(0, 10));
			  temp += "}";
			  temp += ",";
		  }
		  
		  temp = temp.substring(0, temp.length()-1);
		  temp += "]";
				
		  writer.print(temp);		
		  writer.close();
		  
		  //req.setAttribute("count", count);
		
	}
	
}