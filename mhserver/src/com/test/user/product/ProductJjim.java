package com.test.user.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/product/productjjim.do")
public class ProductJjim extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//상품번호
		String seq = req.getParameter("seq");
//		String mseq = req.getParameter("mseq");
		String pseq = req.getParameter("pseq");
		
		ProductDAO dao = new ProductDAO();
		
		JjimDTO jdto = new JjimDTO();
		
		jdto.setSeq(seq);
//		jdto.setMseq(mseq);
		jdto.setPseq(pseq);
		
		
		int result = dao.addjjim(jdto);
		dao.close(); //DB 닫기
		
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();

		
		/*
		 * if (result ==1) { PrintWriter writer = resp.getWriter();
		 * writer.print("<html>"); writer.print("<body>"); writer.print("<script>");
		 * writer.print("alert('success.');");
		 * writer.print("location.href='/mh/productdetail.do?seq=" + pseq + "';");
		 * writer.print("</script>"); writer.print("</body>"); writer.print("</html>");
		 * writer.close();
		 * 
		 * 
		 * } else { //글쓰기 실패 PrintWriter writer = resp.getWriter();
		 * writer.print("<html>"); writer.print("<body>"); writer.print("<script>");
		 * writer.print("alert('failed'); history.back();"); writer.print("</script>");
		 * writer.print("</body>"); writer.print("</html>"); writer.close(); }
		 */
	}
	
}
