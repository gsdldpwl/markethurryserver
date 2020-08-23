package com.test.user.mypage;

import java.io.IOException;

import java.text.DecimalFormat;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.main.MemberDAO;

@WebServlet("/user/mypage/mypage_cinfo.do")
public class Mypage_Cinfo extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. DB 작업
		// 1-1. 등급 정보
		// 1-2. 마일리지
		//2. 결과 전달 + JSP 호출하기
		
		//dao, session 객체 생성
		MypageDAO dao = new MypageDAO();
		HttpSession session = req.getSession();
		
		// ---- #todo 임의로 세션에 seq=1 회원 정보 넣어줌 ---- (이후 삭제)
		session.setAttribute("seq", "77");
		session.setAttribute("name", "강예우");
		session.setAttribute("id", "lkfxca630");
		session.setAttribute("email", "awzxca571@nate.com");
		session.setAttribute("tel", "01084761172");
		session.setAttribute("gradeseq", "4");
		session.setAttribute("address", "대구광역시 단양군 미호동 302-31");
		session.setAttribute("birth", "1983-03-19");
		session.setAttribute("gender", "1");
		// ----------------------------------------------------
	
		
		// ## 1-1. 회원 정보 및 등급 ##
		// 1. 등급 정보 저장된 HashMap 가져옴
		HashMap<String, String> gradeinfo = dao.getGradeInfo((String)session.getAttribute("gradeseq"));
		
		// 2. 가져온 등급 정보 HashMap 보냄
		req.setAttribute("gradeinfo", gradeinfo);
		
		
		// ## 1-2. 회원 마일리지 정보 ##
		// 1. 회원의 마일리지 내역 받아오기
		int mileage = dao.getNowMileage((String)session.getAttribute("seq"));
		String totalmilaege = String.format("%,d", mileage);
		// 2. 회원의 마일리지 내역 보냄
		req.setAttribute("totalmilaege", totalmilaege);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/inc/mypage_cinfo.jsp");
		dispatcher.include(req, resp);
		
		
		
	}

}
