package com.test.admin.statistics;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * @author 이예지
 * 관리자 - 통계관리에서 상품분류별 판매순위 페이지와 관련된 Ok파일
 *
 */
@WebServlet("/admin/statistics/categoryrankingok.do")
public class CategoryRankingOk extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//1. 데이터 가져오기(buseo)
		//2. DB 작업 > select
		//3. 결과 반환 > JSON 반환
		
		
		//1.
		req.setCharacterEncoding("UTF-8");
		String category = req.getParameter("category");
		
		//2.
		RankingDAO dao = new RankingDAO();
		//ArrayList<RankingDTO> list = dao.categoryranking(category);
		
		//3.
		/*
		 
		 [
		 	{
		 		name: '부장',
		 		cnt: 10
		 	},
		 	{
		 		name: '과장',
		 		cnt: 20
		 	}
		 ]
		 
		 */
		
		//import 되게
		JSONArray arr = new JSONArray();
		
//		for (RankingDTO dto : list) {
//			
//			JSONObject obj = new JSONObject();
//			obj.put("name", dto.getJikwi());
//			obj.put("y", Integer.parseInt(dto.getCnt()));
//			
//			arr.add(obj);
//		}
		
		//3.
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter writer = resp.getWriter();
		writer.print(arr);
		writer.close();
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/statistics/categoryrankingok.jsp");

		dispatcher.forward(req, resp);
		
		
	}
	
}
