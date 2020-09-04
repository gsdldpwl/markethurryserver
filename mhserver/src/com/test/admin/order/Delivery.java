package com.test.admin.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * @author ks008
 * 배송과 관련된 것을 통합조회하는 서블릿입니다.
 */
@WebServlet("/admin/order/delivery.do")
public class Delivery extends HttpServlet {                                                              

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/order/delivery.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}