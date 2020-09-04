package com.test.user.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author 이예지
 * 상품 상세페이지에서 사용하는 장바구니 관련
 * 넣으려는 상품이 DB에 존재하는지 확인 후 쿼리를 나눠 실행
 */
@WebServlet("/user/product/productcart.do")
public class ProductCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		// 상품번호 및 데이터
		String seq = req.getParameter("seq");
		String mseq = ((String)session.getAttribute("seq"));
		String pseq = req.getParameter("pseq");
		String qty = req.getParameter("qty");

		// setter
		CartDTO cdto = new CartDTO();
		cdto.setSeq(seq);
		cdto.setMseq(mseq);
		cdto.setPseq(pseq);
		cdto.setQty(qty);

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
