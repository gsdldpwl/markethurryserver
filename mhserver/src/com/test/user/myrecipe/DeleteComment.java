package com.test.user.myrecipe;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletecomment.do")
public class DeleteComment extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//댓글seq와 레피시 seq필요!
		String rseq = req.getParameter("seq"); //레피시seq
		String cseq = req.getParameter("cseq");//댓글seq
		
		RecipeDAO rdao = new RecipeDAO();
		
		int result = rdao.deleteComment(cseq);
		
	
		//3.
		if (result == 1) {
			//글쓰기 성공 -> 게시판 목록 보기로 이동
			resp.sendRedirect("/mh/user/myrecipe/myrecipedetail.do?seq=" + rseq);
			
		} else {
			//글쓰기 실패
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();			
		}	

		
		
		
		
	}
}
