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

   
   //0~8 카테고리번호
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

   
   //
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
            //이름 & 제목 & 내용 - 포괄 검색
            //String sql = String.format("select seq, name, regdate, category, price from (select a.*, rownum as rnum from (select * from product where seq like '%%' || ? || '%%' or name like '%%' || ? || '%%' order by seq asc) a) where rnum >= %s and rnum <= %s order by seq desc", map.get("begin"),map.get("end"));

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