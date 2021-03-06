package com.test.user.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 이예지
 * 상품 상세페이지 - 상품리뷰 조회수 관련
 *
 */
@WebServlet("/user/product/productreviewCount.do")
public class ProductReview extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String reviewSeq = req.getParameter("rseq");
		
		ReviewDAO dao = new ReviewDAO();
		int result = dao.plusReviewCount(reviewSeq);
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
	}
	
}
