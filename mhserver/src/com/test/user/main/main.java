package com.test.user.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.event.EventDTO_lh;
import com.test.user.product.ProductlistDTO;

@WebServlet("/user/main/main.do")
public class main extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String seq = (String) session.getAttribute("seq");
		
		MainDAO dao = new MainDAO();

		// 오늘의 인기 상품
		ArrayList<ProductlistDTO> todayHotList = dao.gettodyHotProduct();
		
		// HOT 상품
		ArrayList<ProductlistDTO> hotList = dao.getHotProduct();
		
		//알뜰 상품
		ArrayList<ProductlistDTO> salesList = dao.getSalesProduct();
		
		// 이달의 이벤트
		ArrayList<EventDTO_lh> eventList = dao.getEventList();
		
		// 마켓커리의 추천
		ArrayList<ProductlistDTO> recommendList = dao.getRecommendProduct();
		
		dao.close();
		
		req.setAttribute("todayhotlist", todayHotList);
		req.setAttribute("hotlist", hotList);
		req.setAttribute("saleslist", salesList);
		req.setAttribute("eventlist", eventList);
		req.setAttribute("recommendList", recommendList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/main/main.jsp");
		dispatcher.forward(req, resp);
		
	}
}
	