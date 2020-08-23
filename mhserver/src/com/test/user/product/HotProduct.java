package com.test.user.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/product/hotproduct.do")
public class HotProduct extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DB작업
		HotProductDAO dao = new HotProductDAO();
		
		ArrayList<HotProductDTO> list = new ArrayList<HotProductDTO>();
		
		list = dao.Hotlist();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/product/hotproduct.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}