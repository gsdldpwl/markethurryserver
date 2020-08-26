package com.test.user.myrecipe;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;
import com.test.user.product.ProductlistDTO;

public class RecipeDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public RecipeDAO() {
		DBUtil util = new DBUtil();
		conn = util.open();
	}

	public void close() {

		try {
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("RecipeDAO");
		}

	}

	// 페이징으로 myrecipe 리스트 보여주기
	public ArrayList<RecipeDTO> list(HashMap<String, String> map) {
		try {

			String sql = String.format(
					"select * from (select a.* , rownum as rnum from (select * from vwRecipe  where delflag=0 order by regdate desc) a) where rnum >= %s and rnum <= %s order by regdate desc",
					map.get("begin"), map.get("end"));

			Statement stat = null;
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<RecipeDTO> list = new ArrayList<RecipeDTO>();

			while (rs.next()) {

				RecipeDTO dto = new RecipeDTO();

				dto.setSeq(rs.getString("seq")); // seq

				dto.setCategory(rs.getString("category")); // 분류
				// 분류 숫자 -> 한글
				if (rs.getString("category").equals("0")) {
					dto.setCategory("한식");

				} else if (rs.getString("category").equals("1")) {
					dto.setCategory("중식");

				} else if (rs.getString("category").equals("2")) {
					dto.setCategory("양식");

				} else if (rs.getString("category").equals("3")) {
					dto.setCategory("일식");

				} else {
					dto.setCategory("기타");
				}

				dto.setTitle(rs.getString("title")); // 제목
				dto.setRegdate(rs.getString("regdate")); // 등록날짜
				dto.setReadCount(rs.getInt("readCount")); // 조회수
				dto.setImg(rs.getString("img")); // 이미지
				dto.setMemberID(rs.getString("memberID")); // 회원아이디

				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			System.out.println("RecipeDAO.get()");
			e.printStackTrace();

		}

		return null;
	}

	public int getTotalCount() {

		try {

			Connection conn = new DBUtil().open();
			PreparedStatement pstat = null;

			String sql = "select count(*) as cnt from vwrecipe where delflag=0";
			pstat = conn.prepareStatement(sql);

			rs = pstat.executeQuery();
			int temp = 0;
			if (rs.next()) {
				temp = rs.getInt("cnt");
			}
			return temp;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	// 조회수 증가시키기
	public void updateReadCount(String seq) {
		try {

			String sql = "update receipe set readCount = readCount + 1 where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.updateReadCount()");
			e.printStackTrace();
		}

	}

	// recipedetail
	public RecipeDTO get(String seq) {
		try {
			String sql = "select seq, (select id from member where seq = r.memberseq) as memberid, title, content,regdate, readcount, img, category from receipe r  where seq = ? and delflag=0";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				RecipeDTO dto = new RecipeDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setImg(rs.getString("img"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate").substring(0, 10));
				dto.setReadCount(rs.getInt("readcount"));
				dto.setMemberID(rs.getString("memberid"));
				dto.setTitle(rs.getString("title"));
				dto.setCategory(rs.getString("category"));

				// 분류 숫자 -> 한글
				if (rs.getString("category").equals("0")) {
					dto.setCategory("한식");

				} else if (rs.getString("category").equals("1")) {
					dto.setCategory("중식");

				} else if (rs.getString("category").equals("2")) {
					dto.setCategory("양식");

				} else if (rs.getString("category").equals("3")) {
					dto.setCategory("일식");

				} else {
					dto.setCategory("그외");
				}

				return dto;
			}

		} catch (Exception e) {
			System.out.println("BoardDAO.get()");
			e.printStackTrace();
		}

		return null;

	}

	public ArrayList<ProductlistDTO> productlist(String seq) {
		// 묶음 상품의 재료 종류를 넣어보자

		try {

			String sql = "select to_char( p.price , '999,999,999,999,999') as price, p.name as name from combiproduct cp inner join product p on cp.productseq=p.seq where receipeseq = ? and p.delflag = 0";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<ProductlistDTO> list = new ArrayList<ProductlistDTO>();

			while (rs.next()) {
				ProductlistDTO pdto = new ProductlistDTO();
				pdto.setName(rs.getString("name"));
				pdto.setPrice(rs.getString("price"));

				list.add(pdto);
			}

			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<CommentDTO> listComment(String seq) {
		// 댓글 불러오기

		try {

			String sql = "select a.*, (select id from Member where seq = a.memberseq) as memberID from receipeComment a where receipeseq = ? and delflag = 0 order by regdate asc and deflag = 0";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<CommentDTO> clist = new ArrayList<CommentDTO>();

			while (rs.next()) {
				// 레코드 1줄 -> DTO 1개
				CommentDTO cdto = new CommentDTO();

				cdto.setMemberID(rs.getString("memberid"));
				cdto.setContent(rs.getString("content"));
				cdto.setRegdate(rs.getString("regdate").substring(0, 10));
//				cdto.setCmtseq(rs.getString("commentseq") == null ? "0" : "1");

				clist.add(cdto);
			}

			return clist;

		} catch (Exception e) {
			System.out.println("RecipeDAO.listComment()");
			e.printStackTrace();
		}

		return null;
	}

	public int write(CommentDTO dto) {
		//새로 추가된 댓글 추가해버리기
		try {
			
			String sql = "insert into receipecomment (seq, receipeseq, commentseq, memberseq, content, regdate, delflag) values (seqreceipecomment.nextVal, ?, null, ?, ?, sysdate, default)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSeq()); //레시피 seq 		
//			pstat.setString(2, dto.getCmtseq()); //대댓글 seq : null 
			pstat.setString(2, dto.getMseq()); //멤버seq->로그인한 사람꺼 
			pstat.setString(3, dto.getContent());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("RecipeDAO.write()");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public ArrayList<RecipeDTO> bestList() {
		//베스트레시피
		
		try {
			
			String sql = "select rownum, x.* from ( select a.* from vwRecipe a order by a.readcount desc) x where rownum <= 3 and delflag = 0";
			
			Statement stat = null;
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<RecipeDTO> bestList = new ArrayList<RecipeDTO>();
			
			while (rs.next()) {
				RecipeDTO dto = new RecipeDTO();

				dto.setSeq(rs.getString("seq")); // seq

				dto.setCategory(rs.getString("category")); // 분류
				// 분류 숫자 -> 한글
				if (rs.getString("category").equals("0")) {
					dto.setCategory("한식");

				} else if (rs.getString("category").equals("1")) {
					dto.setCategory("중식");

				} else if (rs.getString("category").equals("2")) {
					dto.setCategory("양식");

				} else if (rs.getString("category").equals("3")) {
					dto.setCategory("일식");

				} else {
					dto.setCategory("기타");
				}

				dto.setTitle(rs.getString("title")); // 제목
				dto.setRegdate(rs.getString("regdate")); // 등록날짜
				dto.setReadCount(rs.getInt("readCount")); // 조회수
				dto.setImg(rs.getString("img")); // 이미지
				dto.setMemberID(rs.getString("memberID")); // 회원아이디

				bestList.add(dto);
			}
			
			return bestList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean isOwner(RecipeDTO dto) {
		// DeleteOK -> 글쓴이 확인

		try {

			String sql = "select count(*) as cnt from receipe a where (select id from Member where seq = a.memberseq) = ? and seq = ? and delflag = 0 ";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getMemberID()); // 회원아이디
			pstat.setString(2, dto.getSeq()); // 레시피 번호

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("cnt") == 1 ? true : false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("RecipeDAO.isOwner()");
		}
		return false;
	}

	public int delete(String seq) {
		// DeleteOK -> 글 번호 받아와서 삭제

		try {

			String sql = "update receipe set delflag = 1 where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("RecipeDAO.delete()");
		}

		return 0;
	}

	public int edit(RecipeDTO rdto) {
		// myrecipe_editok (레피시 수정하기)

		try {

			String sql = "update receipe set category = ?, title = ?, content = ?, regdate = sysdate, img = ? where seq = ?";

			pstat = conn.prepareStatement(sql);
			System.out.println(rdto.toString());

			pstat.setString(1, rdto.getCategory()); // 분류
			pstat.setString(2, rdto.getTitle()); // 제목
			pstat.setString(3, rdto.getContent()); //내용
			pstat.setString(4, rdto.getImg()); // 이미지
			pstat.setString(5, rdto.getSeq()); // 레시피seq

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("RecipeDAO.edit()");
		}

		return 0;
	}

}
