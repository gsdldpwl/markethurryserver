package com.test.user.customercenter;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/customercenter/notice.do")
public class Notice extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//select title, regdate, readcount, content from notice where seq=1;
		
		//1. 데이터 가져오기(seq)
		//2. DB 작업 -> select
		//3. 결과 반환 + JSP 호출하기
		
		
		HttpSession session = req.getSession();
		
		//1. notice.do?seq=1
		String seq = req.getParameter("seq");
		
//		String search = req.getParameter("search"); //검색
		
		
		//2. DB 담당자에게 위임
		// - 글번호 전달하고 레코드 1개(CustomerDTO) 반환받기
		CustomerDAO dao = new CustomerDAO();
		
		
		if (session.getAttribute("read") == null || (boolean)session.getAttribute("read") == false) {
			//2.3 조회수 증가
			dao.updateReadcount(seq);
			
			session.setAttribute("read", true);
		}
		
		
		
		
		  CustomerDTO dto2 = new CustomerDTO();
		  dto2.setSeq(seq);
//		  dto2.setMseq((String)session.getAttribute("seq"));//**** ?????????
		 		 
		
		  CustomerDTO dto = dao.get(dto2);
		 
		
		
//		2.5 데이터 가공
//		a. 개행 문자 처리
		String content = dto.getContent();
		content = content.replace(".", "<br><br>");
		dto.setContent(content);
		
		/*
		 * //b. 검색어 부각시키기 if (search != null && search != "") { content =
		 * content.replace(search, "<span style='font-weight:bold;color:tomato;'>" +
		 * search + "</span>"); dto.setContent(content); }
		 */
		
		
		//3. CustomerDAO에게 반환받은 CustomerDTO(게시글 1개)를 출력하기 위해서 JSP 페이지에게 전달하기
		req.setAttribute("dto", dto);
//		req.setAttribute("search", search);
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/customercenter/notice.jsp");

		dispatcher.forward(req, resp);
		
		
	}

}
