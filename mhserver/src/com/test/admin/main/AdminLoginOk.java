package com.test.admin.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.main.MainDAO;
import com.test.user.main.MemberDTO;

/**
 * @author leeho
 * 관리자 로그인 확인 서블릿
 */
@WebServlet("/admin/main/adminloginok.do")
public class AdminLoginOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("userid");
		String pw = req.getParameter("userpw");
		
		int result = 0;
		if(id.equals("admin") && pw.equals("admin")) {
			result = 1;
		}
		
		// 로그인 성공
		if(result == 1) {
			resp.sendRedirect("/mh/admin/main/adminmain.do");
		} 
		// 로그인 실패
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
