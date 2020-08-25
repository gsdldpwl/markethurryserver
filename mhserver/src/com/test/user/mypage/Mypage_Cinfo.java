package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.main.MemberDAO;
import com.test.user.main.MemberDTO;

@WebServlet("/user/mypage/mypage_cinfo.do")
public class Mypage_Cinfo extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		myService(req, resp);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		myService(req, resp);		
		
	}

	private void myService(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		//1. DB 작업
		// 	로그인 정보 없으면 로그인창 띄움.
		// 1-0. 회원 개인 정보
		// 1-1. 등급 정보
		// 1-2. 마일리지
		//2. 결과 전달 + JSP 호출하기
		
		//dao, session 객체 생성
		MypageDAO dao = new MypageDAO();
		MemberDAO mdao = new MemberDAO();
		HttpSession session = req.getSession();
		
		
		// ## 로그인 정보가 없으면 로그인 창으로 보내줌 ##
		if (session.getAttribute("seq") == null || session.getAttribute("seq").toString() == "") {
			//resp.sendRedirect("/mh/user/main/login.do");
			PrintWriter writer = resp.getWriter();

			writer.print("<script>location.href='/mh/user/main/login.do';</script>");
			writer.close();
			return; // *****
		}
		

		// ## 1-0. 회원 개인 정보 ##
		MemberDTO dto = mdao.setinfo((String)session.getAttribute("seq"));		

		// 2. 로그인 회원 정보 dto 보냄
		req.setAttribute("dto", dto);
		
		
		// ## 1-1. 회원 정보 및 등급 ##
		// 1. 등급 정보 저장된 HashMap 가져옴
		HashMap<String, String> gradeinfo = dao.getGradeInfo(dto.getGradeseq());
		
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
