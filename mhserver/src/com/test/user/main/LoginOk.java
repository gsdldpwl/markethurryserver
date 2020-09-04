package com.test.user.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author leeho
 * 사용자가 입력한 id,pw가 일치하는지 확인
 */
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
		
		// id,pw 확인
		int result = dao.loginCheck(dto);
		
		// 로그인 성공 시 세션에 멤버 seq 넣어줌
		if(result == 1) {
			dto = dao.setinfo(dto);
			HttpSession session = req.getSession();
			session.setAttribute("seq", dto.getSeq());
			resp.sendRedirect("/mh/user/main/main.do");
		} 
		// 실패 시 사용자에게 메시지 전달
		else {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('로그인에 실패했습니다. 아이디와 비밀번호를 다시 확인해주세요.'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	}

}

