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
import javax.servlet.http.HttpSession;

@WebServlet("/user/product/productlist.do")
public class ProductList extends HttpServlet {
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
	   
      
      HttpSession session = req.getSession();
      session.setAttribute("seq", 25);
      //목록인지 검색인지? 구분짓기
      //String search = req.getParameter("search");
      
      
      //정렬 기준
      String sort = req.getParameter("sort");//sort정렬
      String sortNum = sort;
      String sortname = "";
      String sortcolor = "on";
      
      
      if (sort == null || sort == "") {
         sort = "sales"; //기본값
         sortname = "인기상품순";
         sortcolor = "on";
      }
        HashMap<String,String> map = new HashMap<String,String>();
      //map.put("search", search);
      
      //0이면 신상품순, 1번은 인기상품순, 2번 낮은가격순, 3번이 높은가격순
      if (sort.equals("0")) {
    	  //신상품
    	  sort = "regdate desc";
    	  sortname = "신상품순";
    	  sortcolor = "on";
    	  
  	} else if (sort.equals("1")) {
  		//높은 판매량
  		 sort = "sales desc";
  		sortname = "인기상품순";
  		sortcolor = "on";
  	} else if (sort.equals("2")) {
  		//낮은가격순
  		 sort = "price";
  		sortname = "낮은가격순";
  		sortcolor = "on";
  	} else if (sort.equals("3")) {
  		//높은가격순
  		 sort = "price desc";
  		sortname = "높은가격순";
  		sortcolor = "on";
  	}
      
      
      map.put("sort", sort); 
      map.put("sortname", sortname); 
    
      

      //페이징 처리 관련 변수
      int nowPage = 0;          //현재 페이지 번호
      int totalCount = 0;       //총 게시물 수
      int pageSize = 30;          //한페이지 당 출력 갯수
      int totalPage = 0;         //총 페이지 수
      int begin = 0;            //rnum 시작 번호
      int end = 0;            //rnum 끝 번호
      int n = 0;               //페이지바 관련 변수
      int loop = 0;            //페이지바 관련 변수
      int blockSize = 10;         //페이지바 관련 변수


         
      //list.do?page=현재페이지숫자
      String page = req.getParameter("page");
      
      if (page == null || page == "") nowPage = 1; //default
      else nowPage = Integer.parseInt(page);

      //nowPage -> 보려는 페이지 번호!
      begin =((nowPage -1 )*pageSize)+1;
      end= begin + pageSize -1;
      
      map.put("begin",begin + "");
      map.put("end",end + "");
      map.put("category",req.getParameter("category"));
      ProductlistDAO dao = new ProductlistDAO();
      
      // 총 페이지수 계산하기
      totalCount = dao.getTotalCount(map);
      totalPage =(int)Math.ceil((double)totalCount / pageSize);
      
      
      //상품목록 가져오는애 
      ArrayList<ProductlistDTO> list = dao.list(map);
      
      
      
      //페이지바 제작
      loop = 1;
      n = ((nowPage - 1) / blockSize) * blockSize + 1;
      
      
      
      String pagebar = "";
      
      pagebar += "<nav class=\"pagebar\">";
      pagebar += "<ul class=\"pagination\">";
      
      //이전 10페이지
      if (n == 1) {
         pagebar += "<li class='disabled'>";
         pagebar += "<a href=\"#!\" aria-label=\"Previous\">";
         pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
         pagebar += "</a>";
         pagebar += "</li>";
      } else {
         pagebar += "<li>";
         pagebar += String.format("<a href=\"/mh/user/product/productlist.do?category=%s&page=%d\" aria-label=\"Previous\">", map.get("category"),n - 1);
         pagebar += "<span aria-hidden=\"true\">&laquo;</span>";
         pagebar += "</a>";
         pagebar += "</li>";
      }
      
      //for (int i=1; i<=totalPage; i++) {
      while (!(loop > blockSize || n > totalPage)) {
         //페이지 번호
         if (n == nowPage) {
            pagebar += "<li class='active'>";
            pagebar += String.format("<a href=\"#!\">%d</a>", n);
            pagebar += "</li>";
         } else {         
            pagebar += "<li>";
            pagebar += String.format("<a href=\"/mh/user/product/productlist.do?category=%s&page=%d\">%d</a>", map.get("category"),n, n);
            pagebar += "</li>";
         }
         
         loop++;
         n++;
      }
      
      //다음 10페이지
      if (n > totalPage) {
         pagebar += "<li class='disabled'>";
         pagebar += "<a href=\"#!\" aria-label=\"Next\">";
         pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
         pagebar += "</a>";
         pagebar += "</li>";
      } else {
         pagebar += "<li>";
         pagebar += String.format("<a href=\"/mh/user/product/productlist.do?category=%s&page=%d\" aria-label=\"Next\">", map.get("category"), n);
         pagebar += "<span aria-hidden=\"true\">&raquo;</span>";
         pagebar += "</a>";
         pagebar += "</li>";
      }
      
      
      pagebar += "</ul>";
      pagebar += "</nav>";
      
      
      //req.setAttribute("search",search);
      
      req.setAttribute("list",list);
    
      
      req.setAttribute("page",page);
      req.setAttribute("totalCount",totalCount);
      req.setAttribute("totalPage",totalPage);
      req.setAttribute("category", req.getParameter("category"));
      req.setAttribute("pagebar",pagebar);
      req.setAttribute("sort",sort);
      req.setAttribute("sortNum",sortNum);
      req.setAttribute("sortname",sortname);
      
      
      
      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/product/productlist.jsp");

      dispatcher.forward(req, resp);
   }
}