package com.test.admin.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author leeho
 * 주문관리 전체주문목록 페이지 호출 서블릿
 */
@WebServlet("/admin/order/totalorder.do")
public class TotalOrder extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/order/totalorder.jsp");
		dispatcher.forward(req, resp);

	}
}
