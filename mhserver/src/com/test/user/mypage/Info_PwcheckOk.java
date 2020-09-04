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
 * 마이페이지 > 회원정보수정 > 비밀번호 확인 정보 전달 서블릿
 */
@WebServlet("/user/mypage/info_pwcheckok.do")
public class Info_PwcheckOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(id, pw)
		//2. DB 작업 > select
		//3. 결과 반환 > 완료 처리
		
		//1.
		String id = req.getParameter("inputId");
		String pw = req.getParameter("inputPw");
		
		//2.
		MypageDAO dao = new MypageDAO();
		
		int result = dao.pwcheck(id, pw);
		
		//3.
		if (result == 1) {
			// 비밀번호 일치
			resp.sendRedirect("/mh/user/mypage/info_modify.do");
		} else {
			// 비밀번호 불일치
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('비밀번호가 일치하지 않습니다.'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		
	}
}
