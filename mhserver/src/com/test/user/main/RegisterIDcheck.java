package com.test.user.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @author leeho
 * 회원가입 아이디 중복체크
 */
@WebServlet("/user/main/registeridcheck.do")
public class RegisterIDcheck extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		
		
		MainDAO dao = new MainDAO();
		int result = dao.idcheck(id);
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
	}
	
	

}
