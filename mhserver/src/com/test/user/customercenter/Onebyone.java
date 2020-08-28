package com.test.user.customercenter;



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

import com.test.user.main.MemberDTO;


@WebServlet("/user/customercenter/onebyone.do")
public class Onebyone extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// (!gnhdy596
		HttpSession session = req.getSession();
		
		String seq = (String) session.getAttribute("seq");
		
		CustomercenterDAO dao = new CustomercenterDAO();
		
		if(seq != null) {
			ArrayList<OnebyoneDTO> list = dao.getOBOList(seq);
			req.setAttribute("list", list);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/customercenter/onebyone.jsp");
			dispatcher.forward(req, resp);
		} else {
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
