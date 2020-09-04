package com.test.user.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author 신수진
 * 마이페이지 > 다음 달 내 등급 안내 페이지
 */
@WebServlet("/user/mypage/membership_next.do")
public class Membership_Next extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업
		// - 총구매금액 반환
		//2. 결과 전달 + JSP 호출하기
		
		//1. 
		MypageDAO dao = new MypageDAO();
		HttpSession session = req.getSession();
		
		int total = dao.getTotalPurchase((String)session.getAttribute("seq"));

		req.setAttribute("total", total);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/membership_next.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
