package com.test.user.customercenter;

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
 * @author leeho
 * 1:1 문의 작성 
 */
@WebServlet("/user/customercenter/onebyoneinquiry.do")
public class OnebyoneInquiry extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		// 로그인 상태인 경우 1:1 문의 창으로 이동
		if(session.getAttribute("seq") != null) {
			
			CustomercenterDAO dao = new CustomercenterDAO();
			
			if(req.getParameter("seq") != null) {
				req.setAttribute("orderseq", req.getParameter("seq"));
			} 
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/customercenter/onebyoneinquiry.jsp");
			dispatcher.forward(req, resp);
			
		} 
		// 비로그인 시 안내창과 함께 로그인 페이지로 이동
		else {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('로그인 하셔야 본 서비스를 이용하실 수 있습니다.'); location.href='/mh/user/main/login.do';");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		
	}
}
