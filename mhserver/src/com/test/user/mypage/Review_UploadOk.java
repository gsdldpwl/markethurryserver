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
 * 마이페이지 > 상품후기 > 상품후기 등록 확인 서블릿
 */
@WebServlet("/user/mypage/review_uploadok.do")
public class Review_UploadOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기(수정할 값들)
		//2. DB 작업 -> update
		//3. 결과 처리
		
		//1.
		req.setCharacterEncoding("UTF-8");
		
		String odseq = req.getParameter("odseq");
		String seq = req.getParameter("seq");
		String title = req.getParameter("UserInputTitle");
		String content = req.getParameter("UserInputsubstance");
		String image = req.getParameter("upload-file");
		System.out.println(odseq);
		//2.
		MypageDAO dao = new MypageDAO();
		
		ReviewDTO dto = new ReviewDTO();
		dto.setOrderdetailseq(odseq);
		dto.setSeq(seq);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setImage(image);
		
		//3.
		int result = dao.uploadReview(dto);
		
		if (result == 1) {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('후기 작성이 완료되였습니다.'); location.href='/mh/user/mypage/review.do';");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
		} else if (result == 0) {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<head>");
			writer.print("<meta charset='UTF-8'>");
			writer.print("</head>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('후기 작성에 실패하였습니다.'); history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
		}
		
		
	}

}
