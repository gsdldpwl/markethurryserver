package com.test.admin.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @author ks008
 * 배송준비중인 것을 조회하는 서블릿입니다.
 */
@WebServlet("/admin/order/preparedelivery.do")
public class PrepareDelivery extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		  RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/order/preparedelivery.jsp");
		  dispatcher.forward(req, resp);

	}

}