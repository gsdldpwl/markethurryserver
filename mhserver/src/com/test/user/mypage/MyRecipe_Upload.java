package com.test.user.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * 마이레시피의 나만의 레시피에서 새글 등록을 구현하며  myrecipe_upload.jsp와 연결되어있는 클래스입니다.
 * @author 장소진
 *
 */
@WebServlet("/user/mypage/myrecipe_upload.do")
public class MyRecipe_Upload extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/myrecipe_upload.jsp");
		dispatcher.forward(req, resp);
		
	}

}
