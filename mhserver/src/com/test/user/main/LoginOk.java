package com.test.user.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/main/loginok.do")
public class LoginOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("userid");
		String pw = req.getParameter("userpw");
		
		MainDAO dao = new MainDAO();
		MemberDTO dto = new MemberDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		
		// sampleid:ufahtf942
		// samplepw:(!gnhdy596
		
		int result = dao.loginCheck(dto);
		
		PrintWriter writer = resp.getWriter();
		
		if(result == 1) {
			dto = dao.setinfo(dto);
			HttpSession session = req.getSession();
			session.setAttribute("seq", dto.getSeq());
			resp.sendRedirect("/mh/user/main/main.do");
		} else {
			
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	}

}
