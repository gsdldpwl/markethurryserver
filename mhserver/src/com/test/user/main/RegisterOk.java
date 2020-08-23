package com.test.user.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/main/registerok.do")
public class RegisterOk extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		MainDAO dao = new MainDAO();
		
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("username");
		String email = req.getParameter("email");
		String tel= req.getParameter("tel");
		String address = req.getParameter("addressbox") + " " + req.getParameter("addressbox2");
		String birth = req.getParameter("birth").equals("") ? null : req.getParameter("birth").replace("-", "");
		
		String gender = "";
		if(req.getParameter("gender").equals("m")) {
			gender = "1";
		} else if(req.getParameter("gender").equals("w")) {
			gender = "2";
		} else {
			gender = "0";
		}
				
				
		Connection conn = new DBUtil().open();
		PreparedStatement pstat = null;
		int result = 0;
		try {
			String sql = "insert into member values (seqmember.nextVal,?,?,?,?,?,default,?,?,?,default)";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			pstat.setString(2, pw);
			pstat.setString(3, name);
			pstat.setString(4, email);
			pstat.setString(5, tel);
			pstat.setString(6, address);
			pstat.setString(7, birth);
			pstat.setString(8, gender);
			
			result = pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		PrintWriter writer= resp.getWriter();
		resp.setCharacterEncoding("UTF-8");
		
		if(result == 1 ) {
			writer.print("<html>"); 
			writer.print("<body>");
			writer.print("<script>");
			writer.print("location.href='/mh/user/main/main.do'");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		} else {
			// 회원가입 실패
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('회원가입에 실패했습니다. 다시 시도해주십시오.'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	}
}
