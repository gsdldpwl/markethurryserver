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

@WebServlet("/user/mypage/mileage.do")
public class Mileage extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업
		// - 회원 마일리지 모든 정보 가져오기
		//2. 결과 전달 + JSP 호출하기
		
		//1. 
		MypageDAO dao = new MypageDAO();
		HttpSession session = req.getSession();
		
		ArrayList<MileageDTO> mileagedto = dao.getMileageList((String)session.getAttribute("seq"));

		//2.
		req.setAttribute("mileagedto", mileagedto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/mileage.jsp");
		dispatcher.forward(req, resp);
		
	}

}
