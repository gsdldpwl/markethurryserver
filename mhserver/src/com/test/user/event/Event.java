package com.test.user.event;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/event/event.do")
public class Event extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DB작업 -> select로 seq랑 이미지 링크 가져오기
		EventDAO dao = new EventDAO();
		
		ArrayList<EventDTO> list = new ArrayList<EventDTO>();
		
		list = dao.img();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/event/event.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}