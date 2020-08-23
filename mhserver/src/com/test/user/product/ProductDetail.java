package com.test.user.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.customercenter.CustomerDAO;
import com.test.user.customercenter.CustomerDTO;

@WebServlet("/user/product/productdetail.do")
public class ProductDetail extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
//		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		ProductDAO dao = new ProductDAO();
		
		//상품 관련
		ProductDTO dto = dao.get(seq);
		
		//적립율..
//		dto.setMseq((String)session.getAttribute("seq"));
		String mseq = "1"; //회원번호 1로 고정
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getper(mseq); //회원번호로 적립율 가져오기
		req.setAttribute("mdto", mdto);
		
		//개행문자
		String content = dto.getContent();
		content = content.replace(".", "<br><br>");
		dto.setContent(content);
		req.setAttribute("dto", dto);
		
		
		
		// 관련 레시피 가져오기
		ArrayList<RecipeDTO> recipeinfo = dao.getRelativeRecipe(seq);
		req.setAttribute("recipeinfo", recipeinfo);
		

		
		//리뷰 관련
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO rdto = rdao.getdeliveryinfo(seq); //상품번호
		req.setAttribute("rdto", rdto);
		
		ArrayList<ReviewDTO> rlist = dao.getreview(seq);
		req.setAttribute("rlist", rlist);
		

		
		//상품 문의
		ArrayList<InquiryDTO> ilist = dao.getinquiry(seq);
		req.setAttribute("ilist", ilist);
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/product/productdetail.jsp");
		dispatcher.forward(req, resp);
		
		
	}

}
