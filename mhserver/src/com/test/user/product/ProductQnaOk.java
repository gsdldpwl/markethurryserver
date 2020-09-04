package com.test.user.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author 이예지
 * 상품 상세페이지 - 상품문의 관련
 *
 */
@WebServlet("/user/product/productqnaok.do")
public class ProductQnaOk extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String mseq = String.valueOf(session.getAttribute("seq"));
		String pseq = req.getParameter("pseq");
		String img = req.getParameter("img");
		
		
		ProductDAO dao = new ProductDAO();
		
		InquiryDTO dto = new InquiryDTO();
		
		dto.setTitle(title);
		dto.setContent(content);
		dto.setMseq(mseq);
		dto.setPseq(pseq);
		dto.setImg(img);
		
		
		int result = dao.addqna(dto);
		dao.close(); //DB 닫기
		
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
	
}
