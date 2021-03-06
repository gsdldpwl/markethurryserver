package com.test.user.product;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;
import com.test.user.customercenter.CustomerDTO;

/**
 * @author 이예지
 * 상품 상세페이지 관련
 *
 */
public class ProductDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ProductDAO() {
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
	 * 상품 번호, 이름, 부제, 내용, 가격, 이미지를 가져오는 기본 메소드
	 * @param 상품 번호
	 * @return 해당 상품번호에 맞는 상품 번호, 이름, 부제, 내용, 가격, 이미지를 반환
	 */
	public ProductDTO get(String seq) {
		
		try {
			
			String sql = "select seq, name, shortdesc, content, price, img from product where seq=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq); // 상품번호
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setShortdesc(rs.getString("shortdesc"));
				dto.setPrice(rs.getString("price"));
				dto.setImg(rs.getString("img"));
				
				return dto;				
			}
			
			
		} catch (Exception e) {
			System.out.println("ProductDAO.get()");
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
	

	/**
	 * 상품 상세페이지의 상품후기
	 * @param 상품번호
	 * @return 해당 상품번호에 있는 상품후기를 반환
	 */
	public ArrayList<ReviewDTO> getreview(String seq) {
		
		
		try {
			
			String sql = "select rownum, r.seq as seq, r.title as title, m.name as name, to_char(r.regdate, 'yyyy-mm-dd') as regdate, r.readcount as readcount, r.image as image, r.content as content, m.id as id " + 
					"					from member m inner join orderlist ol" + 
					"					        on m.seq = ol.memberseq" + 
					"					           inner join orderdetail od" + 
					"                                on ol.seq = od.orderseq" + 
					"					                    inner join review r" + 
					"					                       on r.orderdetailseq = od.seq " + 
					"					                            where od.productseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq); // 상품번호
			
			rs = pstat.executeQuery();
			
			ArrayList<ReviewDTO> rlist = new ArrayList<ReviewDTO>();
			
			while (rs.next()) {
				
				ReviewDTO rdto = new ReviewDTO();
				
				
				rdto.setContent(rs.getString("content"));
				rdto.setSeq(rs.getString("seq"));
				rdto.setReadcount(rs.getInt("readcount"));
				rdto.setTitle(rs.getString("title"));
				rdto.setRegdate(rs.getString("regdate"));
				rdto.setImage(rs.getString("image"));
				rdto.setName(rs.getString("name"));
				rdto.setRownum(rs.getString("rownum"));
				rdto.setId(rs.getString("id"));
				
				rlist.add(rdto);
				
			}
			
			return rlist;
			
		} catch (Exception e) {
			System.out.println("ProductDAO.getreview()");
			e.printStackTrace();
		}
		
		
		return null;
	}

	
	 /**
	  * 후기 번호를 받아 조회수를 올려주는 메소드
	  * @param 글 번호(후기)
	  */
	void updateReadcount(String seq) {
		 
		 try {
			 
			 String sql = "update review set readcount = readcount + 1 where seq = ?";
				
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			 
			
		} catch (Exception e) {
			System.out.println("ProductDAO.updateReadcount()");
			e.printStackTrace();
		}
		 
		 
		
	}

	/**
	 * 상품 상세페이지에 상품문의 리스트 출력
	 * @param 상품번호
	 * @return 해당 상품번호의 상품문의(번호, 제목, 등록일, 내용, 이미지, id, 답변) 반환
	 */
	public ArrayList<InquiryDTO> getinquiry(String seq) {
		
		try {
			
			String sql = "select rownum, i.seq as seq, i.title as title, to_char(i.regdate, 'yyyy-mm-dd') as regdate, i.img as img, i.content as content, i.answer as answer, (select id from member where seq = m.seq) as id" + 
					" from inquiry i" + 
					"    inner join member m" + 
					"        on m.seq = i.memberseq" + 
					"            where i.productseq = ?";
			
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq); // 상품번호
			
			rs = pstat.executeQuery();
			
			ArrayList<InquiryDTO> ilist = new ArrayList<InquiryDTO>();
			
			while (rs.next()) {
				
				InquiryDTO idto = new InquiryDTO();
				
				idto.setContent(rs.getString("content"));
				idto.setSeq(rs.getString("seq"));
				idto.setTitle(rs.getString("title"));
				idto.setRegdate(rs.getString("regdate"));
				idto.setImg(rs.getString("img"));
				idto.setId(rs.getString("id"));
				idto.setAnswer(rs.getString("answer"));
				idto.setRownum(rs.getString("rownum"));
				
				ilist.add(idto);
				
				
			}
			
			return ilist;
			
			
		} catch (Exception e) {
			System.out.println("ProductDAO.getinquiry()");
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	
	
	/**
	 * 묶음상품과 관련된 레시피를 가져오는 메소드
	 * @param 묶음상품 번호
	 * @return 해당 묶음상품번호와 관련된 레시피번호, 레시피제목, 레시피 이미지를 반환
	 */
	public ArrayList<RecipeDTO> getRelativeRecipe(String seq) {
		
		try {
			// 이미지랑 이름 가져오기
			String sql = "select rownum, r.seq, r.title, r.img from receipe r inner join combiproduct cp on cp.receipeseq = r.seq where cp.productseq=? and rownum <= 3";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			
			ArrayList<RecipeDTO> relist = new ArrayList<RecipeDTO>();
			
			while (rs.next()) {
				
				RecipeDTO redto = new RecipeDTO();
				
				redto.setSeq(rs.getString("seq"));
				redto.setImg(rs.getString("img"));
				redto.setTitle(rs.getString("title"));
				
				relist.add(redto);
				
			}
					
			return relist;

			
		} catch (Exception e) {
			System.out.println("ProductDAO.getRelativeRecipe()");
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 상품문의 작성 페이지에서 상품명에 사용되는 메소드
	 * @param 상품번호
	 * @return 해당 상품번호와 일치하는 상품번호, 상품명 반환
	 */
	public ProductDTO productname(String seq) {
		
		try {
			
			String sql = "select seq, name from product where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setName(rs.getString("name"));
				dto.setSeq(rs.getString("seq"));
				
				return dto;
				
			}
			
			
		} catch (Exception e) {
			System.out.println("ProductDAO.productname()");
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
	/**
	 * 상품문의 작성 관련 메소드
	 * @param 상품번호, 회원번호, 제목, 내용, 이미지
	 * @return insert 성공 유무에 따라 0 또는 1 반환
	 */
	public int addqna(InquiryDTO dto) {
		 
		 try {
			 
			 String sql = "insert into inquiry (seq, productseq, memberseq, title, content, img, regdate) values (seqinquiry.nextval, ?, ?, ?, ?, ?, default)";
				
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getPseq());
			pstat.setString(2, dto.getMseq());
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getContent());
			pstat.setString(5, dto.getImg());
			
			return pstat.executeUpdate();
			 
			
		} catch (Exception e) {
			System.out.println("ProductDAO.addqna()");
			e.printStackTrace();
		}
		 
		return 0;
		
	}
	
	
	/**
	 * 찜목록에 상품 추가
	 * @param 회원번호, 상품번호
	 * @return insert 성공 유무에 따라 0 또는 1 반환
	 */
	public int addjjim(JjimDTO dto) {
		
		try {
			
			String sql = "insert into jjim (seq, memberseq, productseq) values (seqjjim.nextval, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getMseq());
			pstat.setString(2, dto.getPseq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ProductDAO.addjjim()");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	
	/**
	 * 장바구니에 상품 추가
	 * @param 회원번호, 상품번호, 수량
	 * @return insert 성공 유무에 따라 0 또는 1 반환
	 */
	public int addcart(CartDTO cdto) {
		
		try {
			String sql = "";
			
			sql = "insert into shoppingcart (seq, memberseq, productseq, qty, regdate) values (seqshoppingcart.nextval, ?, ?, ?, sysdate)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cdto.getMseq());
			pstat.setString(2, cdto.getPseq());
			pstat.setString(3, cdto.getQty());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ProductDAO.addcart()");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	/**
	 * 장바구니에 같은 상품이 존재하는지 확인하는 메소드
	 * @param 회원번호, 상품번호
	 * @return 해당 회원번호, 상품번호를 가진 컬럼 수량 반환
	 */
	public int checkexist(CartDTO cdto) {
		try {
			String sql = "select count(*) as cnt from shoppingcart where memberseq = ? and productseq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cdto.getMseq());
			pstat.setString(2, cdto.getPseq());
			
			rs = pstat.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println("ProductDAO.checkexist()");
			e.printStackTrace();
		}
		return 0;
	}

	
	
	/**
	 * 장바구니에 상품 추가(기존에 상품이 존재하는 경우)
	 * @param 수량, 회원번호, 상품번호
	 * @return 0 또는 1 반환
	 */
	public int updateCart(CartDTO cdto) {
		try {
			String sql = "";
			
			sql = "update shoppingcart set qty = ? where memberseq = ? and productseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cdto.getQty());
			pstat.setString(2, cdto.getMseq());
			pstat.setString(3, cdto.getPseq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ProductDAO.updateCart()");
			e.printStackTrace();
		}
		
		return 0;
	}
	
	

	/**
	 * 찜 목록에 이미 상품이 존재하는지 확인하는 메소드
	 * @param 회원번호, 상품번호
	 * @return 해당 회원번호, 상품번호를 가진 컬럼 수량 반환
	 */
	public int checkjjim(JjimDTO jdto) {
		
		
		try {
			String sql = "select count(*) as cnt from jjim where memberseq = ? and productseq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, jdto.getMseq());
			pstat.setString(2, jdto.getPseq());
			
			rs = pstat.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("ProductDAO.checkjjim()");
			e.printStackTrace();
		}
		return 0;
		
		
	}

	
	
	

	
}
