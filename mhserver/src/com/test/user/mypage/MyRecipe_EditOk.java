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
 * 마이페이지의 나만의 레시피 수정에서 DB와 연동을 할 수 있도록 도와주는 클래스 입니다.
 * @author 장소진
 *
 */
@WebServlet("/user/mypage/myrecipeeditok.do")
public class MyRecipe_EditOk extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 데이터 가져오기(수정할 값들)
		// 2. DB작업 - > update
		// 3. 결과 처리

		// 1.
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		
		String rseq = req.getParameter("seq"); // recipe seq
		String category = req.getParameter("category");// 레시피 분류
		String title = req.getParameter("title"); // 레시피 제목
		String content = req.getParameter("content"); // 레시피 내용
		String img = req.getParameter("img");// 레시피 이미지

		// 2.
		RecipeDAO rdao = new RecipeDAO();
		RecipeDTO rdto = new RecipeDTO();
		rdto.setSeq(rseq);
		rdto.setCategory(category);
		rdto.setTitle(title);
		rdto.setContent(content);
		rdto.setImg(img);


		RecipeDTO rdto2 = new RecipeDTO();
		rdto2.setSeq(rseq); // 삭제할 글번호
		rdto2.setMemberID((String) session.getAttribute("memberID")); // 로그인한 아이디

		int result = rdao.edit(rdto);

		// 3.
		if (result == 1) {

			// 수정 성공 -> 이동하기
			PrintWriter writer = resp.getWriter();
			writer.print("alert('수정 완료 되었습니다.');");
			resp.sendRedirect("/mh/user/myrecipe/myrecipedetail.do?seq=" + rseq);

		} else {
			// 수정 실패
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
