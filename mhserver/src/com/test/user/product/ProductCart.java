package com.test.user.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/product/productcart.do")
public class ProductCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		// 상품번호 및 데이터
		String seq = req.getParameter("seq");
		String mseq = req.getParameter("mseq");
		mseq = "1";
		String pseq = req.getParameter("pseq");
		String qty = req.getParameter("qty");
//		String regdate = req.getParameter("regdate");

		// setter
		CartDTO cdto = new CartDTO();
		cdto.setSeq(seq);
		cdto.setMseq(mseq);
		cdto.setPseq(pseq);
		cdto.setQty(qty);
//		cdto.setRegdate(regdate);

		// 넣으려는 상품이 DB에 존재하는지를 검사
		ProductDAO dao = new ProductDAO();
		int cnt = dao.checkexist(cdto);
		int result = 0;
		
		// 있는 경우
		if (cnt > 0) {
			result = dao.updateCart(cdto);
		}
		// 없는 경우
		else {
			result = dao.addcart(cdto);
		}
		
		
		dao.close(); // DB 닫기

		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();

	}

}
