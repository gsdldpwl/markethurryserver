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

/**
 * @author 신수진
 * 마이페이지 > 찜목록 > 찜목록 페이지
 */
@WebServlet("/user/mypage/jjimlist.do")
public class JjimList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. DB 작업 : 회원번호 넘겨서 > 주문 데이터 가져옴
		//2. 결과 전달
		
		//1.
		MypageDAO dao = new MypageDAO();
		HttpSession session = req.getSession();
		
		ArrayList<JjimListDTO> jjimlistdto = dao.getJjimList((String)session.getAttribute("seq"));

		//2.
		req.setAttribute("jjimlistdto", jjimlistdto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/jjimlist.jsp");
		dispatcher.forward(req, resp);
		
	}

}
