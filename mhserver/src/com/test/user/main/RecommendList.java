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


@WebServlet("/user/main/recommendlist.do")
public class RecommendList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String category = req.getParameter("category");
		
		Connection conn = new DBUtil().open();
		PreparedStatement pstat = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from(select * from product where delflag = 0 and category=? order by regdate desc) a where rownum <=4";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, category);
			
			rs = pstat.executeQuery();
			
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
			
			JSONArray arr = new JSONArray();
			
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
			
			PrintWriter writer = resp.getWriter();
			writer.print(arr);
			writer.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		
	}
}
