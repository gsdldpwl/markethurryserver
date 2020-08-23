package com.test.user.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/product/cheapproduct.do")
public class CheapProduct extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DB작업
		CheapProductDAO dao = new CheapProductDAO();
		
		ArrayList<CheapProductDTO> list = new ArrayList<CheapProductDTO>();
		
		list = dao.Cheaplist();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/product/cheapproduct.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}