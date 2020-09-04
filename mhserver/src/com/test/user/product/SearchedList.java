package com.test.user.product;

import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author leeho
 * 사용자가 검색한 값과 일치하는 상품 정보를 가져오는 서블릿
 */
@WebServlet("/user/product/searchedlist.do")
public class SearchedList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 사용자가 입력한 검색값
		String search = req.getParameter("search");

		// 페이징 처리 관련 변수
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 12; // 한 페이지당 출력 갯수
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
			nowPage = Integer.parseInt(page);

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin );
		map.put("end", end );
		
		ProductlistDAO dao = new ProductlistDAO();
		ArrayList<ProductlistDTO> list = dao.getSearchedList(search, map);

		totalCount = dao.getTotalCountOfSearch(search);
		totalPage = (int) Math.ceil((double) totalCount / pageSize);
			
		// 페이지바 제작
	      loop = 1;
	      n = ((nowPage - 1) / blockSize) * blockSize + 1;
	      System.out.println(n);
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
	         pagebar += String.format("<a href=\"/mh/user/product/searchedlist.do?page=%d&search=%s\" aria-label=\"Previous\">", n - 1,search);
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
	            pagebar += String.format("<a href=\"/mh/user/product/searchedlist.do?page=%d&search=%s\">%d</a>", n,search,n);
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
	         pagebar += String.format("<a href=\"/mh/user/product/searchedlist.do?page=%d&search=%s\" aria-label=\"Next\">", n,search);
	         pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
	         pagebar += "</a>";
	         pagebar += "</li>";
	      }

	      pagebar += "</ul>";
	      pagebar += "</nav>";

	      pagebar += "</ul>";
	      pagebar += " </nav>";

		req.setAttribute("search", search);
		req.setAttribute("list", list);
		req.setAttribute("size", totalCount);
		req.setAttribute("pagebar", pagebar);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/product/searchedList.jsp");
		dispatcher.forward(req, resp);

	}
}
