package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.user.myrecipe.RecipeDTO;

@WebServlet("/user/mypage/myrecipeuploadok.do")
public class MyRecipe_UploadOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 한글유지
		req.setCharacterEncoding("UTF-8");

		// url을 통해 넘긴 데이터들을 req.getParameter로 가져옴
		// 이후 마지막 1글자 빼고 split
		// split이 완료된 데이터를 insert하는 DAO method에 전달
		String seqs = req.getParameter("selectedlist"); // 687,434,618,746,
		seqs = seqs.substring(0, seqs.length() - 1);
		String[] list = seqs.split(",");

		// 데이터 가져오기
		String category = req.getParameter("rcpTypeList1");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String img = req.getParameter("img");

		for (String test : list) {
			// System.out.println(test);
		}
		
		//데이터 가져오기
		HttpSession session = req.getSession();
		
		MyRecipe_BoardDAO dao = new MyRecipe_BoardDAO(); 
		RecipeDTO rdto = new RecipeDTO();
		
		rdto.setMseq((String)session.getAttribute("seq"));//회원번호
		rdto.setCategory(category); //분류
		rdto.setTitle(title); //제목
		rdto.setContent(content); //내용
		rdto.setImg(img); //이미지
		
		int result = dao.boardWrite (rdto);
		int result2 = dao.boardCombiWrite(list);
		
		
		if(result2 == list.length) {
			// 성공
			PrintWriter writer = resp.getWriter();
			writer.print("alert('등록 완료 되었습니다.');");
			resp.sendRedirect("/mh/user/mypage/myrecipe.do");	
		} else {
			// 실패
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
