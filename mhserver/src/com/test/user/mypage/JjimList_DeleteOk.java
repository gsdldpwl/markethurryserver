package com.test.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 신수진
 * 마이페이지 > 찜목록 > 찜목록 삭제 서블릿
 */
@WebServlet("/user/mypage/jjimlist_deleteok.do")
public class JjimList_DeleteOk extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(buseo)
		//2. DB 작업 > select
		//3. 결과 반환 > JSON 반환
		
		//1.
		String jseq = req.getParameter("jseq");
		
		//2.
		MypageDAO dao = new MypageDAO();
		int result = dao.deleteJjim(jseq);
		
		PrintWriter writer = resp.getWriter();
		writer.print(result);
		writer.close();
		
		
	}

}
