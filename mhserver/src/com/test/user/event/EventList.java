package com.test.user.event;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.user.product.ProductDTO;


/**
 * @author ks008
 * 이벤트 상품 목록을 조회하는 서블릿입니다.
 */
@WebServlet("/user/event/eventlist.do")
public class EventList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String title = "";
		
		//DB작업 -> 이벤트seq로 select를 통해 이미지, 상품명, 가격, 짧은 설명 가져오기
		EventDAO dao = new EventDAO();
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		title = dao.title(seq);
		list = dao.list(seq);
		
		req.setAttribute("title", title);
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/event/eventlist.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}