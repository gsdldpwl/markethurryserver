package com.test.user.myrecipe;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

@WebServlet("/user/myrecipe/myrecipecommentok.do")
public class MyrecipeCommentOk extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	//1.
	HttpSession session = req.getSession();
	//추후 삭제해야함 #todo
	session.setAttribute("seq", "1");
	
	//형변환
	req.setCharacterEncoding("UTF-8");
	
	//레시피 페이지 seq 가져오기
	String seq = req.getParameter("seq"); 

	
	String reply = req.getParameter("reply");
		
	//댓글 내용 가져오기
	String content = req.getParameter("content");
	//String mseq = (String)session.getAttribute("seq");//글쓴 회원번호 ->로그인후
	
	//2. DB 작업 위임 -> recipeDAO
	RecipeDAO dao = new RecipeDAO();

	CommentDTO cdto = new CommentDTO();
	
	cdto.setContent(content);
	cdto.setSeq(seq);//레시피
	cdto.setMseq((String)session.getAttribute("seq"));//멤버

	int result = dao.write(cdto);
	String status = "";
	if(result > 0) {
		status = "SUCCESS";
	}else {
		status = "FAIL";
	}
	
	resp.setContentType("text/plan");
	resp.getWriter().write(status);
  }

}
