package com.test.admin.statistics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.admin.product.ProductDTO;
import com.test.user.main.DBUtil;



/**
 * @author 이예지
 * 관리자 - 통계관리의 판매순위 관련 클래스
 *
 */
public class RankingDAO {
   
   private Connection conn;
   private Statement stat;
   private PreparedStatement pstat;
   private ResultSet rs;
   
   public RankingDAO() {
      DBUtil util = new DBUtil();
      conn = util.open();
   }
   
   public void close() {
      try {
         conn.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   
   
   	/**
     * @return 상품 카테고리 번호(0~8)
     */
	public ArrayList<String> categorylist() {
      
      try {
         
         String sql = "select distinct category from product order by category asc";
         
         stat = conn.createStatement();
         rs = stat.executeQuery(sql);
         
         ArrayList<String> list = new ArrayList<String>();
         
         while (rs.next()) {
            list.add(rs.getString("category"));
         }
         
      } catch (Exception e) {
         System.out.println("RankingDAO.categorylist()");
         e.printStackTrace();
      }
      
      return null;
   }

   
   
   /**
    * 통계관리 - 판매상품순위에서 검색과 관련
    * @param map : 검색어와 selectbox에서 선택된 값
 	* @return 검색어, sel값 유무에 따라 다른 쿼리가 실행되며 상품의 카테고리, 번호, 이름, 가격, 판매량, 환불수량이 반환
 	*/
	public ArrayList<ProductDTO> productrlist(HashMap<String, String> map) {
      try {
         String search = map.get("search");
         String sel = map.get("sel");
         String sql = "";
         if (search != null && sel != null) { 
            
            if (search == "") { //검색X, 분류O
               sql = "select p.category as category, p.seq as seq, p.name as name, p.price as price, p.sales as sales, (select count(*) from orderdetail od inner join orderlist ol on od.orderseq = ol.seq inner join delivery d on ol.seq = d.orderseq where d.category = 3 and od.productseq=p.seq) as refund" + 
                     " from product p" 
                     + " where rownum <= 10 and category = " + sel
                     + " order by sales desc";
            } else { //검색O, 분류O
               sql = "select p.category as category, p.seq as seq, p.name as name, p.price as price, p.sales as sales, (select count(*) from orderdetail od inner join orderlist ol on od.orderseq = ol.seq inner join delivery d on ol.seq = d.orderseq where d.category = 3 and od.productseq=p.seq) as refund" + 
                     " from product p" + 
                     " where name like '%%" + search + "%%' and category = " + sel
                     + "order by sales desc";
            }
            
         } else if (search != null && (sel == null || sel == "")) { //검색O, 분류X
            
            sql = "select p.category as category, p.seq as seq, p.name as name, p.price as price, p.sales as sales, (select count(*) from orderdetail od inner join orderlist ol on od.orderseq = ol.seq inner join delivery d on ol.seq = d.orderseq where d.category = 3 and od.productseq=p.seq) as refund" + 
                  " from product p" + 
                  " where name like '%%" + search + "%%'order by sales desc";
            
            
         }else { //검색X, 분류X
            
            sql = "select p.category as category, p.seq as seq, p.name as name, p.price as price, p.sales as sales, (select count(*) from orderdetail od inner join orderlist ol on od.orderseq = ol.seq inner join delivery d on ol.seq = d.orderseq where d.category = 3 and od.productseq=p.seq) as refund" + 
                  " from product p" 
                  + " where rownum <= 10 "
                  + " order by sales desc";
         }
         
         stat = conn.createStatement();
         rs = stat.executeQuery(sql);
         
         ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
         
         //rs -> list 복사
         while (rs.next()) {
            //레코드 1줄 -> BoardDTO 1개
            ProductDTO dto = new ProductDTO();
            
            dto.setSeq(rs.getString("seq"));
            dto.setName(rs.getString("name"));
            dto.setRefund(rs.getInt("refund"));
            dto.setSales(rs.getInt("sales"));
            dto.setCategory(rs.getString("category"));
            dto.setPrice(rs.getInt("price"));
            
            list.add(dto);
         }
         
         return list;
         
      } catch (Exception e) {
         System.out.println("RankingDAO.productranking()");
         e.printStackTrace();
      }
      return null;
   }

   
}