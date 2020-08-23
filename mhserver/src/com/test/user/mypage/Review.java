package com.test.user.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/mypage/review.do")
public class Review extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업
		//	1-1. 작성한 후기 가져오기
		//	1-2. 작성 가능한 후기 가져오기
		//2. 결과 전달
		
		//1.
		MypageDAO dao = new MypageDAO();
		HttpSession session = req.getSession();
		
		// ## 1-1. 작성한 후기 ##
		ArrayList<ReviewDTO> reviewlist = dao.getReview((String)session.getAttribute("seq"));
		
		// ## 1-2. 작성 가능한 후기 ##
		ArrayList<OrderListDTO> reviewavaillist = dao.getReviewAvail((String)session.getAttribute("seq"));
		
		//2.
		req.setAttribute("reviewlist", reviewlist);
		req.setAttribute("reviewavaillist", reviewavaillist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/review.jsp");
		dispatcher.forward(req, resp);
		
	}

}
