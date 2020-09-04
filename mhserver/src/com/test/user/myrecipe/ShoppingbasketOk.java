package com.test.user.myrecipe;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * 나만의 레시피의 묶음상품에서 장바구니 담기를 클릭했을 때 cart 데이터로 보내기를 위임하기 위한 클래스입니다.
 * @author 장소진
 *
 */
@WebServlet("/user/myrecipe/enrollcombiproduct.do")
public class ShoppingbasketOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		String mseq = req.getParameter("mseq"); // memberseq
		String pseq = req.getParameter("pseq"); // product seq
		String rseq = req.getParameter("rseq");
		String[] pseqlist = pseq.substring(0, pseq.length() - 1).split(",");

		RecipeDAO rdao = new RecipeDAO();
		int result = rdao.send(pseqlist, mseq);

		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
	}
}
