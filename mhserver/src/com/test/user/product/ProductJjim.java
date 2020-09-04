package com.test.user.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author 이예지
 * 상품 상세페이지 - 찜 목록과 관련
 *
 */
@WebServlet("/user/product/productjjim.do")
public class ProductJjim extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		//상품번호
		String seq = req.getParameter("seq");
		String mseq = ((String)session.getAttribute("seq"));
		String pseq = req.getParameter("pseq");
		
		ProductDAO dao = new ProductDAO();
		
		JjimDTO jdto = new JjimDTO();
		
		jdto.setSeq(seq);
		jdto.setMseq(mseq);
		jdto.setPseq(pseq);
		
		int cnt = dao.checkjjim(jdto);
		int result = 0;
		
		
		// 있는 경우
		if (cnt > 0) {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print(result);
			writer.close();
		}
		// 없는 경우
		else {
			result = dao.addjjim(jdto);
			PrintWriter writer = resp.getWriter();
			writer.print(result);
			writer.close();
		}
		

		
		dao.close(); //DB 닫기
		
		
	}
	
}
