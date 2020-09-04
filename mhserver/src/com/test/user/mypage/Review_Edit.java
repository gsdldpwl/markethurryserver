package com.test.user.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 신수진
 * 마이페이지 > 상품후기 > 상품후기 수정 페이지
 */
@WebServlet("/user/mypage/review_edit.do")
public class Review_Edit extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// review seq 받아옴
		String rseq = req.getParameter("seq");

		MypageDAO dao = new MypageDAO();
		
		// DTO 받아옴
		ReviewDTO rdto = dao.getReview(rseq);
		
		req.setAttribute("rdto", rdto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/review_edit.jsp");
		dispatcher.forward(req, resp);
		
	}

}
