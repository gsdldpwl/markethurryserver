package com.test.user.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 신수진
 * 마이페이지 > 주문목록 > 주문 상세 페이지
 */
@WebServlet("/user/mypage/orderdetaillist.do")
public class OrderDetailList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// orderseq 받아옴
		String olseq = req.getParameter("seq");

		MypageDAO dao = new MypageDAO();
		
		// DTO 받아옴
		ArrayList<OrderListDTO> odldto = dao.getOrderDetailList(olseq);
		
		req.setAttribute("odldto", odldto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/orderdetaillist.jsp");
		dispatcher.forward(req, resp);
		
	}

}
