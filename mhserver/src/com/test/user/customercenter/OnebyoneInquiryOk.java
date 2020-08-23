package com.test.user.customercenter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/customercenter/onebyoneinquiryok.do")
public class OnebyoneInquiryOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String mseq = (String) session.getAttribute("seq");
		
		req.setCharacterEncoding("UTF-8");
		String category = req.getParameter("category");
		if(category.equals("배송지연")) {
			category = "0";
		} else if(category.equals("교환문의")) {
			category = "1";
		} else if(category.equals("환불문의"))	{
			category = "2";
		} else if(category.equals("취소문의"))	{
			category = "3";
		} else if(category.equals("기타문의"))	{
			category = "4";
		}
		String title = req.getParameter("title");
		String orderseq = req.getParameter("orderseq");
		String content = req.getParameter("content");
		
		CustomercenterDAO dao = new CustomercenterDAO();
		int result = dao.insertOBOInquiry(category,orderseq,content,mseq,title);
		
		if(result == 1) {
			resp.sendRedirect("/mh/user/customercenter/onebyone.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('1:1 문의 작성에 실패했습니다. 다시 시도해주십시오.'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		
		
	}
}
