package com.test.user.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * 마이페이지의 나만의 레시피 리스트를 출력하며, myrecipe.jsp와 연결되어있는 클래스입니다.
 * @author 장소진
 *
 */
@WebServlet("/user/mypage/myrecipe.do")
public class MyRecipe extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. DB 작업
		// - 레시피 정보 가져오기
		//2. 결과 전달 + JSP 호출하기
		
		//1. 
		MypageDAO dao = new MypageDAO();
		HttpSession session = req.getSession();
		
		ArrayList<MyRecipeDTO> myrecipelist = dao.getMyRecipeList((String)session.getAttribute("seq"));

		req.setAttribute("myrecipelist", myrecipelist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/myrecipe.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
