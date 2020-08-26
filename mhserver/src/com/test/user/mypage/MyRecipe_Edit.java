package com.test.user.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.user.myrecipe.RecipeDAO;
import com.test.user.myrecipe.RecipeDTO;

@WebServlet("/user/mypage/myrecipe_edit.do")
public class MyRecipe_Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 수정할 글 번호 가져오기
		String seq = req.getParameter("seq");

		// 2. 글번호를 가지고 모든 내용 가져오기
		RecipeDAO rdao = new RecipeDAO();

		RecipeDTO rlist = rdao.get(seq);

		// 3. DTO를 JSP에게 전달하면서 호출하기
		req.setAttribute("rlist", rlist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/mypage/myrecipe_edit.jsp");
		dispatcher.forward(req, resp);

	}

}
