package com.test.user.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.NumberFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.user.product.ProductlistDTO;


/**
 * @author leeho
 * 사용자가 입력한 카테고리에 맞는 추천 상품을 돌려주는 서블릿
 */
@WebServlet("/user/main/recommendlist.do")
public class RecommendList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 사용자가 입력한 카테고리
		String category = req.getParameter("category");
		
		Connection conn = new DBUtil().open();
		PreparedStatement pstat = null;
		ResultSet rs = null;
		
		try {
			
			// 사용자가 입력한 카테고리별로 등록날짜 최신순의 상품 4개 가져오기
			String sql = "select * from(select * from product where delflag = 0 and category=? order by regdate desc) a where rownum <=4";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, category);
			
			rs = pstat.executeQuery();
			
			// 가져온 상품을 담을 arraylist
			ArrayList<ProductlistDTO> list = new ArrayList<ProductlistDTO>();
			
			while(rs.next()) {
				ProductlistDTO dto = new ProductlistDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPrice(NumberFormat.getInstance().format(rs.getInt("price")));
				dto.setImg(rs.getString("img"));
				dto.setShortdesc(rs.getString("shortdesc"));
				
				list.add(dto);
			}
			
			// jsp에 전달해줄 JSONArray 선언
			JSONArray arr = new JSONArray();
			
			// 상품 DTO를 담은 arraylist를 돌며 JSONObject로 변환
			for(ProductlistDTO dto : list) {
				JSONObject obj = new JSONObject();
				
				obj.put("seq",dto.getSeq());
				obj.put("name",dto.getName());
				obj.put("img",dto.getImg());
				obj.put("price",dto.getPrice());
				obj.put("shortdesc",dto.getShortdesc());
				
				arr.add(obj);
			}
			
			
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			
			// jsp에 전달
			PrintWriter writer = resp.getWriter();
			writer.print(arr);
			writer.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		
	}
}
