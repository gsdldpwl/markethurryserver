package com.test.user.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author leeho
 * 장바구니 데이터 +,-,삭제 서블릿
 */
@WebServlet("/user/product/shoppingbasketok.do")
public class ShoppingbasketOk extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String mseq = (String) session.getAttribute("seq"); 
		
		String type = req.getParameter("type");
		String pseq = req.getParameter("pseq");
		
		ShoppingbasketDAO dao = new ShoppingbasketDAO();
		// 수량 +
		if(type.equals("0")) {
			dao.addQty(mseq,pseq);
		} 
		// 수량 -
		else if(type.equals("1")) {
			dao.reduceQty(mseq,pseq);
		} 
		// 상품삭제
		else if(type.equals("2")) {
			
			String[] selectedSeq = req.getParameter("selectedSeq").substring(0,req.getParameter("selectedSeq").length()).split(",");
			dao.deleteProduct(mseq,selectedSeq);
		}
		
		dao.close();
		
	}
}
