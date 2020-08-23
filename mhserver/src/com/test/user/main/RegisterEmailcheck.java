package com.test.user.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/user/main/registeremialcheck.do")
public class RegisterEmailcheck extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		System.out.println(email);
		
		MainDAO dao = new MainDAO();
		int result = dao.emailCheck(email);
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
	}
	
	

}
