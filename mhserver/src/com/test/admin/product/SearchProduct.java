package com.test.admin.product;

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
 * @author 이예지
 * 관리자 - 상품조회
 */
@WebServlet("/admin/product/searchproduct.do")
public class SearchProduct extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      
      String search = req.getParameter("search");
      
      String scategory[] = req.getParameterValues("scategory");
      String pcategory[] = req.getParameterValues("pcategory");
      
      String startprice = req.getParameter("startprice");
      String endprice = req.getParameter("endprice");
      
      System.out.println(search);
      
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("search", search);
      
      
      
      ProductDAO dao = new ProductDAO();
      
      
      ArrayList<ProductDTO> list = dao.searchproduct(map);
      
   
      
      req.setAttribute("list", list);
      req.setAttribute("search", search);
      
      
      
      
      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/product/searchproduct.jsp");
      dispatcher.forward(req, resp);

   }
   
}