package com.test.user.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.myrecipe.RecipeDTO;

@WebServlet("/user/mypage/myrecipe_uploadok.do")
public class MyRecipe_UploadOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//한글유지
		req.setCharacterEncoding("UTF-8");
		
		//데이터 가져오기
		HttpSession session = req.getSession();
		
		//회원번호 임의로 설정해놓기
		session.setAttribute("seq","1"); 
		
		//DB작업 위임
		MyRecipe_BoardDAO dao = new MyRecipe_BoardDAO(); 
		RecipeDTO rdto = new RecipeDTO();
		
		rdto.setMseq((String)session.getAttribute("seq"));//회원번호
		
		int result = dao.boardWrite (rdto);
		int result2 = dao.boardCombiWrite(rdto);
		
		
		
		
	}

}
