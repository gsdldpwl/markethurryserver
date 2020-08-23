package com.test.user.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/product/productqna.do")
public class ProductQna extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String seq = req.getParameter("seq");
		ProductDAO dao = new ProductDAO();
		
		//상품 관련
		ProductDTO pdto = dao.productname(seq);
		
		req.setAttribute("pdto", pdto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/product/productqna.jsp");

		dispatcher.forward(req, resp);
		
		
	}

}
