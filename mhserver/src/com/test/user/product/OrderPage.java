package com.test.user.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/product/orderpage.do")
public class OrderPage extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 세션 선언해서 "seq" 가져오시고
		HttpSession session = req.getSession();
		
		// 세션이 있다면 그 세션에 들어있는 회원번호를 request 객체에 넘겨주기
		//String mseq = (String) session.getAttribute("seq");
		String mseq = "1";
		//String mseq = "";
	
		
		// 가져온 seq가 != null 인 if문 거셔서 만약에 있으면 dispatcher 실행하고, 아니면 튕기는 alert창 보내기
		if(mseq != null) {
			OrderPageDAO dao = new OrderPageDAO();
			OrderPageDTO dto = new OrderPageDTO();
			dto.setMemseq((String)session.getAttribute("seq"));//로그인 회원 번호
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/product/orderpage.jsp");
			dispatcher.forward(req, resp);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("alert('로그인 후 이용해주세요.');");
			writer.close();
		}
		
		
		
		
	}
}
