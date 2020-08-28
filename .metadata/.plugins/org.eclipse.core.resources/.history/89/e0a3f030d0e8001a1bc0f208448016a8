package com.test.admin.statistics;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.admin.product.ProductDTO;

@WebServlet("/admin/statistics/productranking.do")
public class ProductRanking extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		String sel = req.getParameter("sel");
		String search = req.getParameter("search");
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("sel", sel);
		
		RankingDAO dao = new RankingDAO();
		
		ArrayList<ProductDTO> list = dao.productrlist(map);
		

		JSONArray arr = new JSONArray();
		
		for (ProductDTO dto : list) {
			
			JSONObject obj = new JSONObject();
			obj.put("name", dto.getName());
			obj.put("y", dto.getSales());
			obj.put("drilldown", dto.getName());
			
			arr.add(obj);
		}
		
		JSONArray arr2 = new JSONArray();
		
		for (ProductDTO dto : list) {
			
			JSONObject obj2 = new JSONObject();
			obj2.put("name", dto.getName());
			obj2.put("y", dto.getSales() * dto.getPrice());
			obj2.put("drilldown", dto.getName());
			
			arr2.add(obj2);
		}
		
		
		req.setAttribute("list", list);
		req.setAttribute("arr", arr);
		req.setAttribute("arr2", arr2);
		req.setAttribute("search", search);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/statistics/productranking.jsp");
		dispatcher.forward(req, resp);

	}
}
