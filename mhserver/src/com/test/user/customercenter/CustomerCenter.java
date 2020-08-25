package com.test.user.customercenter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/customercenter/customercenter.do")
public class CustomerCenter extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		

		String search = req.getParameter("search");
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		
		
		//페이징 처리 관련 변수
			int nowPage = 0;	//현재 페이지 번호
			int totalCount = 0;	//총 게시물 수
			int pageSize = 10;	//한 페이지 당 출력 갯수
			int totalPage = 0;	//총 페이지 수
			int begin = 0;		//rnum 시작 번호
			int end = 0;		//rnum 끝 번호
			int n = 0;			//페이지바 관련 변수
			int loop = 0;		//페이지바 관련 변수
			int blockSize = 10;	//페이지바 관련 변수
			
		
			String page = req.getParameter("page");
			
			if (page == null || page == "") nowPage = 1; //default
			else nowPage = Integer.parseInt(page);
			
		
			begin = ((nowPage - 1) * pageSize) + 1;
			end = begin + pageSize - 1;
			
			map.put("begin", begin + "");
			map.put("end", end + "");
			
		
			//1.
			CustomerDAO dao = new CustomerDAO();
			
			
			totalCount = dao.getTotalCount(map);
			
			totalPage = (int)Math.ceil((double)totalCount / pageSize);
			
			ArrayList<CustomerDTO> list = dao.list(map);
			
			
			Calendar now = Calendar.getInstance();
					
			for (CustomerDTO dto : list) {
				
				//c. 최신글 표시하기
				// - 글쓴지 1시간 이내
				// - 현재 시각 - 글쓴 시각 < 1시간
				
				//b. 오늘 쓴글 구분하기
				//2020-08-04
				if (dto.getRegdate().startsWith(String.format("%tF", now))) 
				{ 
					dto.setRegdate(dto.getRegdate().substring(11));
				} else {
					//a. 날짜 추출하기
					dto.setRegdate(dto.getRegdate().substring(0, 10));
				}
				
	
				
				  if (search != null && search != "") { //d. 검색어 부각시키기 // - 제목 
					  String title = dto.getTitle(); 
					  title = title.replace(search, "<span style='font-weight:bold;color:tomato;'>" + search + "</span>");
					  dto.setTitle(title); 
				  }
				 
				
			}//for
			
			
			//페이지바 제작
			loop = 1;
			n = ((nowPage - 1) / blockSize) * blockSize + 1;
			
			
			String pagebar = "";
			
			pagebar += "<nav class=\"pagebar\" style=\"text-align: center; margin-left: 20px;\">";
			pagebar += "<ul class=\"pagination\">";
			
			//이전 10페이지
			if(n == 1) {
				pagebar += "<li class='disabled'>";
				pagebar += "<a href=\"#!\" aria-label=\"Previous\">";
				pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
				pagebar += "</a>";
				pagebar += "</li>";
			} else {
				pagebar += "<li>";
				pagebar += String.format("<a href=\"/mh/user/customercenter/customercenter.do?page=%d\" aria-label=\"Previous\">", n - 1);
				pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
				pagebar += "</a>";
				pagebar += "</li>";
			}
			
			while(!(loop > blockSize || n > totalPage)) {
				//페이지 번호
				if (n == nowPage) {
					pagebar += "<li class='active'>";
					pagebar += String.format("<a href=\"#!\">%d</a>", n, n);
					pagebar += "</li>";
				} else {
					pagebar += "<li>";
					pagebar += String.format("<a href=\"/mh/user/customercenter/customercenter.do?page=%d\">%d</a>", n, n);
					pagebar += "</li>";
				}
				
				loop++;
				n++;
			
			}
			
			//다음 10페이지
			if(n > totalPage) {
				pagebar += "<li class='disabled'>";
				pagebar += "<a href=\"#!\" aria-label=\"Next\">";
				pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
				pagebar += "</a>";
				pagebar += "</li>";
			} else {
				pagebar += "<li>";
				pagebar += String.format("<a href=\"/mh/user/customercenter/customercenter.do?page=%d\" aria-label=\"Next\">", n);
				pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
				pagebar += "</a>";
				pagebar += "</li>";
			}
			
			pagebar += "</ul>";
			pagebar += "</nav>";		
			

			
			//2.
			req.setAttribute("list", list);
			req.setAttribute("search", search);
			
			req.setAttribute("page", page);
			req.setAttribute("totalCount", totalCount);
			req.setAttribute("totalPage", totalPage);
			
			req.setAttribute("pagebar", pagebar);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/customercenter/customercenter.jsp");

		dispatcher.forward(req, resp);
		
		
	}

}
