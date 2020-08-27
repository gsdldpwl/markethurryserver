package com.test.user.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.mypage.MypageDAO;

@WebServlet("/user/product/orderpageok.do")
public class OrderPageOk extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		String mseq = (String) session.getAttribute("seq"); 
		
		req.setCharacterEncoding("UTF-8");
		
		//하이든 
		String ogprice = req.getParameter("orpayprice").replace(",","");
		String salesprice = req.getParameter("pdslprice").replace(",","");
		String finalprice = req.getParameter("totalprice").replace(",","");
		String[] productseq = req.getParameterValues("pseq");
		String[] orpdqty = req.getParameterValues("orpdqty");
		
		

	
		OrderPageDAO dao = new OrderPageDAO();
		MypageDAO dao3 = new MypageDAO();
		
		OrderPageDTO dto2 = new OrderPageDTO();
		int mileage = dao3.getNowMileage((String)session.getAttribute("seq"));
		
		dto2.setMemmile(String.valueOf(mileage));
		

		
		int result = dao.odtable(mseq,finalprice,dto2);
		int result2 = dao.oddttable(productseq,orpdqty);
		dao.close(); //DB 닫기
		
		//3.
		if (result ==1) {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<meta charset=\"UTF-8\">");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('주문이 완료되었습니다.');");
			writer.print("location.href='/mh/user/main/main.do';");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
			
		} else {
			
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<meta charset=\"UTF-8\">");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('주문에 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		
		
		if (result2 == productseq.length) {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<meta charset=\"UTF-8\">");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('주문이 완료되었습니다!');");
			writer.print("location.href='/mh/user/main/main.do");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
			
		} else {
			
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<meta charset=\"UTF-8\">");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('주문에 실패했습니다!');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	}	
	
}//class
