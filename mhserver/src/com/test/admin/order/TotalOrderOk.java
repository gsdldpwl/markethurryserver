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

import com.test.user.main.MemberDTO;

import oracle.net.aso.l;

@WebServlet("/admin/order/totalorderok.do")
public class TotalOrderOk extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String category = req.getParameter("category");
		
		int flag = 0;
		if(category.equals("상품명")) {flag = 1;}
		
		String word = req.getParameter("word");
		String startdate = req.getParameter("startdate").replace("-", "");
		String enddate = req.getParameter("enddate").replace("-", "");
		
		
		OrderDAO dao = new OrderDAO();
		HashMap<String, String> map = new HashMap<String, String>();
		ArrayList<OrderListDTO> list = dao.getOrderlist(word,startdate,enddate,flag,map);
		
		req.setAttribute("list", list);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/order/totalorder.jsp");
		dispatcher.forward(req, resp);

	}
}
