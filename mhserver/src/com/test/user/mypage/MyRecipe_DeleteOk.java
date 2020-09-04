package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.myrecipe.RecipeDAO;
import com.test.user.myrecipe.RecipeDTO;



/**
 * 마이페이지의 나만의 레시피의 글을 삭제할 수 있도록 DB 데이터와 연동을 도와주는  클래스입니다.
 * @author 장소진
 *
 */
@WebServlet("/user/mypage/myrecipe_deleteok.do")
public class MyRecipe_DeleteOk extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String seq = req.getParameter("seq");
		
		//DB 작업 위임
		RecipeDAO dao = new RecipeDAO();
		
		RecipeDTO dto = new RecipeDTO();
		
		
		//삭제할 글번호
		dto.setSeq(seq);
		//로그인한 아이디, 글번호
//		if (dao.isOwner(dto)) {
		 int result = dao.delete(seq);//seq가지고 가기
		
		//} else { 
		//	result = 2;
	//	}
		
		//3.
		if(result== 1) {
			
			//삭제성공 -> 리스트로 이동
			resp.sendRedirect("/mh/user/mypage/myrecipe.do");
			
		} else if(result == 0) {
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
		} else if(result == 2) {
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('글쓴이만 삭제 가능합니다.'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
	}
		
	}


