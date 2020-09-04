package com.test.admin.statistics;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 이예지
 * 관리자 - 통계관리에서 상품분류별 판매순위 페이지
 *
 */
@WebServlet("/admin/statistics/categoryranking.do")
public class CategoryRanking extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
//		//1. DB 작업 > select
//		//2. 결과 전달 + JSP 호출하기
//		
//		//1.
//		RankingDAO dao = new RankingDAO();
//		
//		//2.
//		ArrayList<String> list = dao.categorylist();
//		
//		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/statistics/categoryranking.jsp");
		dispatcher.forward(req, resp);

		
	}
	
}
