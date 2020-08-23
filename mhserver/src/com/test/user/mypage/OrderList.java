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

@WebServlet("/user/mypage/orderlist.do")
public class OrderList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 연결 후에 주석 풀기!!!!!!!!!!!
//		HttpSession session = req.getSession();
//		session.getAttribute("dto");
		
		//orderlist.do
		//orderlist.do?year=2020
		// ## 셀렉트 박스로 기간 검색 선택 했을 경우를 위해 ##
		
		String year = req.getParameter("year");
		
		//1. DB 작업 : 회원번호 넘겨서 > 주문 데이터 가져옴
		//2. 결과 전달
		
		//1.
		MypageDAO dao = new MypageDAO();
		HttpSession session = req.getSession();
		ArrayList<OrderListDTO> orderlistdto = new ArrayList<OrderListDTO>();
		
		if (year == null) {
			// ## 전체기간 선택시 or 맨 처음 접속시
			orderlistdto = dao.getOrderListAll((String)session.getAttribute("seq"));
			//orderlistdto = dao.getOrderListAll("6");
			year = "all";
		} else {
			// ## 특정 년도 선택시
			orderlistdto = dao.getOrderList((String)session.getAttribute("seq"), year);
			//orderlistdto = dao.getOrderList("6", year);
		}
		
		//2.
		req.setAttribute("orderlistdto", orderlistdto);
		req.setAttribute("year", year);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/orderlist.jsp");
		dispatcher.forward(req, resp);
		
	}
}
