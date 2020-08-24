package com.test.user.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/mypage/review_upload.do")
public class Review_Upload extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// orderdetail seq 받아옴
		req.setCharacterEncoding("UTF-8");
		String odseq = req.getParameter("odseq");
		String pname = req.getParameter("pname");

		req.setAttribute("orderdetailseq", odseq);
		req.setAttribute("productname", pname);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/review_upload.jsp");
		dispatcher.forward(req, resp);
		
	}

}
