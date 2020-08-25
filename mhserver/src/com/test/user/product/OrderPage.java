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

import org.json.simple.JSONArray;

@WebServlet("/user/product/orderpage.do")
public class OrderPage extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 세션 선언해서 "seq" 가져오시고
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		
		// 상품금액, 할인금액, 최종금액
		String ogprice = req.getParameter("ogprice");
		String salesprice = req.getParameter("slPrice");
		String finalprice = req.getParameter("flprice");
		
		// 세션이 있다면 그 세션에 들어있는 회원번호를 request 객체에 넘겨주기
		String mseq = (String) session.getAttribute("seq");
		
		// 체크된 상품들을 가져온다.
		// seq, 이름, 가격, 수량
		String[] productseq = req.getParameterValues("productseq");
		
		// 체크된 상품들을 가져올 list 선언
		ArrayList<ShoppingbasketDTO> productList = new ArrayList<ShoppingbasketDTO>();
		
		// 가져온 상품들을 탐색하는 for문
		for(String product : productseq) {
			
			// , 파싱 진행하여 파싱 완료된 문자열을 담을 list 
			String[] beforeparsing = product.split(",");
			
			// 상품 데이터를 넣을 dto 선언
			ShoppingbasketDTO dto = new ShoppingbasketDTO();
			
			// 데이터가 파싱되어 있는 list를 탐색하며
			for(int i=0; i< beforeparsing.length; i++) {
				// 위에 선언한 dto 객체에 데이터 담아줌
				if(i==0) { 
					dto.setSeq(beforeparsing[i]);
				} else if(i==1) { 
					dto.setName(beforeparsing[i]);
				} else if(i==2) { 
					dto.setPrice(beforeparsing[i]);
				} else if(i==3) { 
					dto.setQty(beforeparsing[i]);
				} else if(i==4) {
					dto.setImg(beforeparsing[i]);
				}
			}
			// 전체 상품들이 들어갈 list에 add
			productList.add(dto);
		}
		
		// 가져온 seq가 != null 인 if문 거셔서 만약에 있으면 dispatcher 실행하고, 아니면 튕기는 alert창 보내기
		if(mseq != null) {
			OrderPageDAO dao = new OrderPageDAO();
			OrderPageDTO dto = new OrderPageDTO();
			dto.setMemseq((String)session.getAttribute("seq"));//로그인 회원 번호
			
			req.setAttribute("list", productList);
			req.setAttribute("ogprice",ogprice );
			req.setAttribute("salesprice",salesprice );
			req.setAttribute("finalprice",finalprice );
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/product/orderpage.jsp");
			dispatcher.forward(req, resp);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("alert('로그인 후 이용해주세요.');");
			writer.close();
		}
	}
}
