package com.test.user.customercenter;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/customercenter/onebyoneanswer.do")
public class OnebyoneAnswer extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		CustomercenterDAO dao = new CustomercenterDAO(); 
		OnebyoneDTO odto = dao.get(seq);
		
		req.setAttribute("odto",odto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/customercenter/onebyoneanswer.jsp");
		dispatcher.forward(req, resp);
	}
}
