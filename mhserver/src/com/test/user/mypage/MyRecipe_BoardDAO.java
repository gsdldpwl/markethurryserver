package com.test.user.mypage;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.user.main.DBUtil;
import com.test.user.myrecipe.RecipeDTO;

public class MyRecipe_BoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MyRecipe_BoardDAO() {
		DBUtil util = new DBUtil();
		conn = util.open();
	}
	
	public void close() {
		
		try {
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MyRecipe_BoardDAO");
		}
		
	}

	public int boardWrite(RecipeDTO rdto) {
		//레시피 게시글을 추가해봅시다
	try {
			//레시피테이블추가
			String sql = "insert into receipe (seq, memberseq, category, title, content, regdate, readcount, img, delflag) values (seqreceipe.nextVal,?,?,?,?,sysdate,0,?,default)";
			
			
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, rdto.getMseq()); //글 작성한 멤버seq
			pstat.setString(2, rdto.getCategory()); //음식 분류
			pstat.setString(3, rdto.getTitle()); //제목
			pstat.setString(4, rdto.getContent()); //내용
			pstat.setString(5, rdto.getImg()); //이미지

			return pstat.executeUpdate();
			
			
	} catch (Exception e) {
		
		e.printStackTrace();
		System.out.println("RecipeDTO boardWrite()");

	}

	
	return 0;	
	}
			

	public int boardCombiWrite(RecipeDTO rdto) {
		//레시피 게시글을 추가해봅시다2
		
		try {
			
			//묶음상품테이블추가
			String combisql = "insert into combiProduct (seq, receipeseq, productseq, delflag) values (seqcombiproduct.nextVal,(select max(seq) from receipe),?,default);";
			
			//select max(seq) from receipe;
			pstat = conn.prepareStatement(combisql);
			
//			pstat.setString(1, x);//user가 선택한 productseq받아오기
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}
	
	public ArrayList<Myrecipe_BoardDTO> list(String seq) {
		//게시판에 구매한 목록들을 불러와볼게 얍
		try {
			
			String sql ="select * from vwChoiceFD where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<Myrecipe_BoardDTO> rlist = new ArrayList<Myrecipe_BoardDTO>();
			
			while (rs.next()) {
				
				Myrecipe_BoardDTO dto = new Myrecipe_BoardDTO();
				
				// 
				dto.setMseq(rs.getString("seq")); //로그인한 회원번호
				dto.setPimg(rs.getString("pimg")); //이미지
				dto.setPname(rs.getString("pname")); // 상품이름
				dto.setPdate(rs.getString("pdate")); // 상품구매날짜
				dto.setPrice(rs.getString("price")); //상품가격
				dto.setPseq(rs.getString("pseq")); //상품seq
				
				rlist.add(dto);
				
			}
			
			return rlist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


}
