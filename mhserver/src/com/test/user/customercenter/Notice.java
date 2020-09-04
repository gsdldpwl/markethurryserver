package com.test.user.customercenter;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author 이예지
 * 고객센터 - 공지사항
 *
 */
@WebServlet("/user/customercenter/notice.do")
public class Notice extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		CustomerDAO dao = new CustomerDAO();
		
		
		if (session.getAttribute("read") == null || (boolean)session.getAttribute("read") == false) {
	
			dao.updateReadcount(seq);
			
			session.setAttribute("read", true);
		}
		
		
		  CustomerDTO dto2 = new CustomerDTO();
		  dto2.setSeq(seq);
		 		 
		
		  CustomerDTO dto = dao.get(dto2);
		 
		
		//개행 문자 처리
		String content = dto.getContent();
		content = content.replace(".", "<br><br>");
		dto.setContent(content);
		
		
		
		//3. CustomerDAO에게 반환받은 CustomerDTO(게시글 1개)를 출력하기 위해서 JSP 페이지에게 전달하기
		req.setAttribute("dto", dto);
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/customercenter/notice.jsp");

		dispatcher.forward(req, resp);
		
		
	}

}
