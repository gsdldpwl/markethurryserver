package com.test.admin.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.test.user.main.MemberDTO;

@WebServlet("/admin/member/memberok.do")
public class MemberOk extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String category = req.getParameter("category");
		
		int flag = 0;
		if(category.equals("거주지")) {
			flag = 1;
		} else if(category.equals("이메일")) {
			flag = 2;
		} else if(category.equals("휴대폰 번호")) {
			flag = 3;
		} 
		
		String word = req.getParameter("word");
		ClientDAO dao = new ClientDAO();
		
		// 페이징
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 10; // 한 페이지당 출력 갯수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // rnum 시작 번호
		int end = 0; // rnum 끝 번호
		int n = 0; // 페이지바 관련변수
		int loop = 0; // 페이지바 관련 변수
		int blockSize = 10; // 페이지바 관련 변수
		
		String page = req.getParameter("page");
		if (page == null || page == "")
			nowPage = 1; // default
		else
			nowPage = Integer.parseInt(page); //

		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("begin", begin + "");
		map.put("end", end + "");

		ArrayList<MemberDTO> list = dao.getClientlist(word,flag,map);
		
		totalCount = dao.getTotalCount(word,flag);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		// 페이지바 제작
	      loop = 1;
	      n = ((nowPage - 1) / blockSize) * blockSize + 1;
	      String pagebar = "";

	      pagebar += "<nav class=\"pagebar\">";
	      pagebar += "<ul class=\"pagination\">";

	      // 이전 10페이지
	      if (n == 1) {
	         pagebar += "<li class='disabled'>";
	         pagebar += "<a href=\"#!\" aria-label=\"Previous\">";
	         pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
	         pagebar += "</a>";
	         pagebar += "</li>";
	      } else {
	         pagebar += "<li>";
	         pagebar += String.format("<a href=\"/mh/admin/member/memberok.do?category=%s&word=%s&page=%d\" aria-label=\"Previous\">",category,word, n - 1);
	         pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
	         pagebar += "</a>";
	         pagebar += "</li>";
	      }

	      while (!(loop > blockSize || n > totalPage)) {
	         // 페이지 번호
	         if (n == nowPage) {
	            pagebar += "<li class='active'>";
	            pagebar += String.format("<a href=\"#!\">%d</a>", n);
	            pagebar += "</li>";
	         } else {
	            pagebar += "<li>";
	            pagebar += String.format("<a href=\"/mh/admin/member/memberok.do?category=%s&word=%s&page=%d\">%d</a>",category,word, n,n);
	            pagebar += "</li>";
	         }
	         loop++;
	         n++;
	      }

	      // 다음 10페이지
	      if (n > totalPage) {
	         pagebar += "<li class='disabled'>";
	         pagebar += "<a href=\"#!\" aria-label=\"Next\">";
	         pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
	         pagebar += "</a>";
	         pagebar += "</li>";
	      } else {
	         pagebar += "<li>";
	         pagebar += String.format("<a href=\"/mh/admin/member/memberok.do?category=%s&word=%s&page=%d\" aria-label=\"Next\">",category,word, n);
	         pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
	         pagebar += "</a>";
	         pagebar += "</li>";
	      }

	      pagebar += "</ul>";
	      pagebar += "</nav>";

	      pagebar += "</ul>";
	      pagebar += " </nav>";
		
		req.setAttribute("list", list);
		req.setAttribute("word", word);
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("page", page);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/member/member.jsp");
		dispatcher.forward(req, resp);

	}
}
