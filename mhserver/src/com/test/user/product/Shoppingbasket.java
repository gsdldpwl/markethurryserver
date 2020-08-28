package com.test.user.product;

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

@WebServlet("/user/product/shoppingbasket.do")
public class Shoppingbasket extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String mseq = (String) session.getAttribute("seq");
		
		if(mseq != null) {
			
			ProductlistDAO dao = new ProductlistDAO();
			ArrayList<ShoppingbasketDTO> list = dao.getShoppingbasketlist(mseq);
			
			double salesper = dao.getSalesPercentage(mseq);
			
			req.setAttribute("list", list);
			req.setAttribute("per", salesper);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/product/shoppingbasket.jsp");
			dispatcher.forward(req, resp);
		} else {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer= resp.getWriter();
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('로그인 후 이용하실 수 있습니다.'); location.href='/mh/user/main/login.do';");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		

	}
}
