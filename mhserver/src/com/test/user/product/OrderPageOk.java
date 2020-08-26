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

@WebServlet("/user/product.OrderPageOk.do")
public class OrderPageOk extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String ogprice = req.getParameter("ogprice");
		String salesprice = req.getParameter("slPrice");
		String finalprice = req.getParameter("flprice");
		
		
		String[] productseq = req.getParameterValues("productseq");
		
		ArrayList<ShoppingbasketDTO> productList = new ArrayList<ShoppingbasketDTO>();
		
		
		ShoppingbasketDTO dto1 = new ShoppingbasketDTO();
	
		OrderPageDAO dao2 = new OrderPageDAO();
		OrderPageDTO dto2 = dao2.memlist((String)session.getAttribute("seq"));
		MypageDAO dao3 = new MypageDAO();
		int mileage = dao3.getNowMileage((String)session.getAttribute("seq"));
		
		dto2.setMemmile(String.valueOf(mileage));
		
		
		
		productList.add(dto1);
		
		int result = dao2.odtable(dto2);
		int result2 = dao2.oddttable(dto2);
		dao2.close(); //DB 닫기
		
		//3.
		if (result ==1) {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<meta charset=\"UTF-8\">");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('문의 작성이 완료되었습니다.');");
			writer.print("location.href='/mh/user/product/productdetail.do?seq=" + pseq + "';");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
			
		} else {
			//글쓰기 실패
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<meta charset=\"UTF-8\">");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('문의를 작성하는데 실패했습니다.');");
			writer.print("history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		
	}	
	
}//class
