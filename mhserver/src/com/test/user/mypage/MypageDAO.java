package com.test.user.mypage;

import java.beans.Statement;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.user.main.DBUtil;

import oracle.jdbc.internal.OracleTypes;

/**
 * 
 * @author 신수진
 * MyPage DB 작업 담당 Class
 */
public class MypageDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private CallableStatement cstat;
	private ResultSet rs;
	
	/**
	 * MypageDAO
	 * DB 연결함
	 */
	public MypageDAO() {
		
		DBUtil util = new DBUtil();
		conn = util.open();
		
	}
	
	/**
	 * MypageDAO
	 * DB 연결 닫음
	 */
	public void close( ) {
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Mypage_Cinfo.java
	 * 회원의 등급 시퀀스를 통해 해당 등급의 정보 가져오는 메소드
	 * @param gradeseq 등급 시퀀스
	 * @return 등급 정보가 저장된 HashMap
	 */
	public HashMap<String, String> getGradeInfo(String gradeseq) {
		
		try {
			
			String sql = "select name, discountper, mileageper from grade where seq = ? and delflag = 0";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, gradeseq);
			
			HashMap<String, String> gradeinfo = new HashMap<String, String>();
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				gradeinfo.put("name", rs.getString("name"));
				gradeinfo.put("discountper", rs.getString("discountper"));
				gradeinfo.put("mileageper", rs.getString("mileageper"));
			}
			
			rs.close();
			pstat.close();
			
			return gradeinfo;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * Mypage_Cinfo.java
	 * 회원의 현재 마일리지를 가져오는 메소드
	 * @param memberseq 회원번호
	 * @return 현재 마일리지
	 */
	public int getNowMileage(String memberseq) {
		
		try {
			
			String sql = "{call proc_nowmileage(?,?)}";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setString(1, memberseq);
			cstat.registerOutParameter(2, OracleTypes.NUMBER);
			
			cstat.executeUpdate();
			int total = cstat.getInt(2);
			
			cstat.close();
			
			return total;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * Membership_Next.java
	 * 회원의 해당 달 총 구매 금액을 알려주는 메소드
	 * @param memberseq 회원번호
	 * @return 총 구매 금액
	 */
	public int getTotalPurchase(String memberseq) {
		
		try {
			
			String sql = "select sum(price) sum from orderlist "
					+ "where regdate >= TRUNC(SYSDATE, 'MONTH') and regdate <= sysdate and memberseq = ? and delflag = 0";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberseq);
			
			rs = pstat.executeQuery();
			
			int total = 0;
			
			if (rs.next()) {
				total = rs.getInt("sum");
			}
			
			rs.close();
			pstat.close();
			
			return total;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * Mileage.java
	 * 회원의 마일리지 적립, 사용 내역을 받아오는 메소드
	 * @param memberseq 회원번호
	 * @return 마일리지 DTO
	 */
	public ArrayList<MileageDTO> getMileageList(String memberseq) {
		
		try {
			
			String sql = "select category, reason, price, regdate from mileage "
					+ "where memberseq = ? and delflag = 0 order by regdate desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<MileageDTO> mileagedto = new ArrayList<MileageDTO>();
			
			while (rs.next()) {
				
				MileageDTO dto = new MileageDTO();
				
				dto.setCategory(rs.getInt("category"));
				dto.setPrice(String.format("%,d",rs.getInt("price")));
				dto.setReason(rs.getString("reason"));
				dto.setRegdate(rs.getString("regdate").split(" ")[0]);
				
				mileagedto.add(dto);
			}
			
			rs.close();
			pstat.close();
			
			return mileagedto;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * MyRecipe.java
	 * 회원이 작성한 레시피의 리스트를 받아온다.
	 * @param memberseq 회원 번호
	 * @return 내레시피 DTO
	 */
	public ArrayList<MyRecipeDTO> getMyRecipeList(String memberseq) {
		
		try {
			
			String sql = "select seq, category, title, img from receipe where memberseq = ? and delflag = 0";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<MyRecipeDTO> myrecipelist = new ArrayList<MyRecipeDTO>();
			
			while (rs.next()) {
				MyRecipeDTO dto = new MyRecipeDTO();
				
				int cat = rs.getInt("category");
				String category = "";
				
				if (cat == 0) {
					category = "한식";
				} else if (cat == 1) {
					category = "중식";
				} else if (cat == 2) {
					category = "양식";
				} else if (cat == 3) {
					category = "일식";
				} else if (cat == 4) {
					category = "그 외";
				}
								
				dto.setCategory(category);
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setImg(rs.getString("img"));
				
				myrecipelist.add(dto);
			}
			
			rs.close();
			pstat.close();
			
			return myrecipelist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * Info_PwcheckOk.java
	 * 개인정보 수정 페이지 -> 비밀번호가 일치한지 확인한다.
	 * @param id 회원의 아이디
	 * @param pw 입력한 비밀번호
	 * @return 결과(1: 일치, 0: 불일치)
	 */
	public int pwcheck(String id, String pw) {
		
		try {
			
			String sql = "select count(*) as cnt from member where id=? and pw=? and delflag = 0";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, pw);
			
			int result = 0;
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
			
			rs.close();
			pstat.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * OrderList.java
	 * 회원의 전체 주문 목록을 가져온다.
	 * @param memberseq 회원 번호
	 * @return 회원의 주문 목록 DTO를 저장한 ArrayList
	 */
	public ArrayList<OrderListDTO> getOrderListAll(String memberseq) {
		
		try {
			
			String sql = "select * from vwOrderlist where mseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<OrderListDTO> list = new ArrayList<OrderListDTO>();
			
			String oltemp = "";
			String ptemp = "";
			
			while (rs.next()) {
				
				OrderListDTO dto = new OrderListDTO();
				
				dto.setDseq(rs.getString("dseq"));
				dto.setOlseq(rs.getString("olseq"));
				dto.setMseq(rs.getString("mseq"));
				dto.setPseq(rs.getString("pseq"));
				dto.setTotalprice(String.format("%,d", rs.getInt("totalprice")));
				dto.setPrice(String.format("%,d", rs.getInt("price")));
				dto.setPname(rs.getString("pname"));
				dto.setImg(rs.getString("img"));
				dto.setQty(rs.getInt("qty"));
				dto.setRegdate(rs.getString("regdate").split(" ")[0].replace("-", "."));
				
				if (rs.getInt("status") == 0) {
					dto.setStatus("배송준비중");					
				} else if (rs.getInt("status") == 1) {
					dto.setStatus("배송중");					
				} else if (rs.getInt("status") == 2) {
					dto.setStatus("배송완료");					
				}
				
				dto.setCategory(rs.getInt("category"));
				dto.setDregdate(rs.getString("dregdate").split(" ")[0]);
				
				if (oltemp.equals(dto.getOlseq())) {
					//상품번호가 같은 경우,
					if(ptemp.equals(dto.getPseq())) {
						// 뷰에서 이미 가장 최근 배송날짜가 먼저 나오게 정렬했으므로,
						// 나중에 나오는 값들을 저장하지 않고 넘기면 됨.
						continue;
					}
				}
				
				list.add(dto);
				oltemp = dto.getOlseq();
				ptemp = dto.getPseq();
			}
			
			rs.close();
			pstat.close();
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * OrderList.java
	 * 회원의 특정 년도 주문 목록을 가져온다.
	 * @param memberseq 회원 번호
	 * @param year 받아올 년도
	 * @return 회원의 특정 년도 주문 목록 DTO를 저장한 ArrayList
	 */
	public ArrayList<OrderListDTO> getOrderList(String memberseq, String year) {
		
		try {
			
			String nextYear = String.format("%d", Integer.parseInt(year) +1);
			
			String sql = "select * from vwOrderlist where mseq = ? and (regdate > ? || '-01-01') and (regdate < ? || '-01-01')";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberseq);
			pstat.setString(2, year);
			pstat.setString(3, nextYear);
			
			rs = pstat.executeQuery();
			
			ArrayList<OrderListDTO> list = new ArrayList<OrderListDTO>();
			
			String oltemp = "";
			String ptemp = "";
			
			while (rs.next()) {
				
				OrderListDTO dto = new OrderListDTO();
				
				dto.setDseq(rs.getString("dseq"));
				dto.setOlseq(rs.getString("olseq"));
				dto.setMseq(rs.getString("mseq"));
				dto.setPseq(rs.getString("pseq"));
				dto.setTotalprice(String.format("%,d", rs.getInt("totalprice")));
				dto.setPrice(String.format("%,d", rs.getInt("price")));
				dto.setPname(rs.getString("pname"));
				dto.setImg(rs.getString("img"));
				dto.setQty(rs.getInt("qty"));
				dto.setRegdate(rs.getString("regdate").split(" ")[0].replace("-", "."));
				
				if (rs.getInt("status") == 0) {
					dto.setStatus("배송준비중");					
				} else if (rs.getInt("status") == 1) {
					dto.setStatus("배송중");					
				} else if (rs.getInt("status") == 2) {
					dto.setStatus("배송완료");					
				}
				
				dto.setCategory(rs.getInt("category"));
				dto.setDregdate(rs.getString("dregdate").split(" ")[0]);
				
				if (oltemp.equals(dto.getOlseq())) {
					//상품번호가 같은 경우,
					if(ptemp.equals(dto.getPseq())) {
						// 뷰에서 이미 가장 최근 배송날짜가 먼저 나오게 정렬했으므로,
						// 나중에 나오는 값들을 저장하지 않고 넘기면 됨.
						continue;
					}
				}
				
				list.add(dto);
				oltemp = dto.getOlseq();
				ptemp = dto.getPseq();
			}
			
			rs.close();
			pstat.close();
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * Review.java
	 * 회원이 작성한 모든 후기를 가져온다.
	 * @param memberseq 회원 번호
	 * @return 회원이 작성한 후기 DTO를 저장한 ArrayList
	 */
	public ArrayList<ReviewDTO> getReviewAll(String memberseq) {
		
		try {
			
			String sql = "select r.*, (select name from product where seq = (select productseq from orderdetail o where seq = r.orderdetailseq and delflag = 0)) as pname "
					+ "from review r where orderdetailseq in (select odseq from vwOrderlist where mseq = ? and delflag = 0)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
			
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setOrderdetailseq(rs.getString("orderdetailseq"));
				dto.setTitle(rs.getString("title"));
				
				// 내용 개행처리
				String content = rs.getString("content");
				content = content.replace("\r\n", "<br>");
				dto.setContent(content);
				
				dto.setImage(rs.getString("image"));
				dto.setRegdate(rs.getString("regdate").split(" ")[0].replace("-", "."));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setPname(rs.getString("pname"));
				
				list.add(dto);
			}
			
			rs.close();
			pstat.close();
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Review.java
	 * 회원의 작성 가능한 후기를 가져온다.
	 * 작성 가능한 후기는 
	 * @param memberseq 회원 번호
	 * @return 회원이 작성 가능한 후기 DTO를 저장한 ArrayList
	 */
	public ArrayList<OrderListDTO> getReviewAvail(String memberseq) {

		try {
			
			String sql = "select * from vworderlist where mseq = ? and dregdate > (sysdate - 30) "
					+ "and odseq not in (select orderdetailseq from review where delflag=0 "
					+ "and orderdetailseq in (select odseq from vwOrderlist where mseq = ? and dregdate > (sysdate - 30)))";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberseq);
			pstat.setString(2, memberseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<OrderListDTO> list = new ArrayList<OrderListDTO>();
			
			String oltemp = "";
			String ptemp = "";
			
			while (rs.next()) {
				
				OrderListDTO dto = new OrderListDTO();
				
				dto.setDseq(rs.getString("dseq"));
				dto.setOlseq(rs.getString("olseq"));
				dto.setOdseq(rs.getString("odseq"));
				dto.setMseq(rs.getString("mseq"));
				dto.setPseq(rs.getString("pseq"));
				dto.setTotalprice(String.format("%,d", rs.getInt("totalprice")));
				dto.setPrice(String.format("%,d", rs.getInt("price")));
				dto.setPname(rs.getString("pname").replace("'", "\'"));
				dto.setImg(rs.getString("img"));
				dto.setQty(rs.getInt("qty"));
				dto.setRegdate(rs.getString("regdate").split(" ")[0].replace("-", "."));
				
				if (rs.getInt("status") == 0) {
					dto.setStatus("배송준비중");					
				} else if (rs.getInt("status") == 1) {
					dto.setStatus("배송중");					
				} else if (rs.getInt("status") == 2) {
					dto.setStatus("배송완료");					
				}
				
				dto.setCategory(rs.getInt("category"));
				dto.setDregdate(rs.getString("dregdate").split(" ")[0]);
				
				if (oltemp.equals(dto.getOlseq())) {
					//상품번호가 같은 경우,
					if(ptemp.equals(dto.getPseq())) {
						// 뷰에서 이미 가장 최근 배송날짜가 먼저 나오게 정렬했으므로,
						// 나중에 나오는 값들을 저장하지 않고 넘기면 됨.
						continue;
					}
				}
				
				list.add(dto);
				oltemp = dto.getOlseq();
				ptemp = dto.getPseq();
			}
			
			rs.close();
			pstat.close();
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * Review_Edit.java
	 * 회원이 작성한 후기를 가져온다.
	 * @param rseq 선택한 후기 sequence
	 * @return 회원이 작성한 후기를 저장한 DTO
	 */
	public ReviewDTO getReview(String rseq) {

		try {
			
			String sql = "select r.*, (select name from product where seq = (select productseq from orderdetail o where seq = r.orderdetailseq and delflag = 0)) as pname "
					+ "from review r where seq = ? and delflag = 0";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, rseq);
			
			rs = pstat.executeQuery();
			
			ReviewDTO dto = new ReviewDTO();
			
			while (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setOrderdetailseq(rs.getString("orderdetailseq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setRegdate(rs.getString("regdate").split(" ")[0].replace("-", "."));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setPname(rs.getString("pname"));
				
			}
			
			rs.close();
			pstat.close();
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Review_EditOk.java
	 * 작성한 후기의 수정된 내용을 업데이트한다.
	 * @param dto 수정된 후기 내용을 저장한 DTO
	 * @return 업데이트 결과(0: 실패, 1: 성공)
	 */
	public int editReview(ReviewDTO dto) {
		
		try {
			
			String sql = "update review set title = ?, content = ?, image = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getImage());
			pstat.setString(4, dto.getSeq());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * Review_Delete.java
	 * 작성한 후기 삭제상태를 업데이트한다.
	 * @param rseq 삭제할 후기의 sequence
	 * @return 업데이트 결과(0: 실패, 1: 성공)
	 */
	public int deleteReview(String rseq) {

		try {
			
			String sql = "update review set delflag = 1 where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, rseq);
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * Review_UploadOk.java
	 * 작성한 후기의 내용을 추가한다.
	 * @param dto 작성된 후기 내용을 저장한 DTO
	 * @return 업데이트 결과(0: 실패, 1: 성공)
	 */
	public int uploadReview(ReviewDTO dto) {

		try {
			
			String sql = "insert into review values (SEQREVIEW.nextval, ?, ?, ?, ?, sysdate, 0, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getOrderdetailseq());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getContent());
			pstat.setString(4, dto.getImage());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * JjimList.java
	 * 회원의 찜목록을 받아온다.
	 * @param memberseq 회원 번호
	 * @return 찜목록 DTO가 저장된 ArrayList
	 */
	public ArrayList<JjimListDTO> getJjimList(String memberseq) {
		
		try {
			
			String sql = "select j.seq jseq, p.seq pseq, p.name pname, p.price price, p.img image from jjim j "
					+ "inner join product p on p.seq = j.productseq where j.memberseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<JjimListDTO> list = new ArrayList<JjimListDTO>();
			
			while (rs.next()) {
				
				JjimListDTO dto = new JjimListDTO();
				dto.setJseq(rs.getString("jseq"));
				dto.setPseq(rs.getString("pseq"));
				dto.setPname(rs.getString("pname"));
				dto.setPrice(String.format("%,d",rs.getInt("price")));
				dto.setImage(rs.getString("image"));
				list.add(dto);
			}
			
			rs.close();
			pstat.close();
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
	}

	/**
	 * OrderDetailList.java
	 * 해당 주문번호의 세부 주문 내역을 받아온다.
	 * @param olseq 주문번호
	 * @return 세부 주문내역 DTO가 담긴 ArrayList
	 */
	public ArrayList<OrderListDTO> getOrderDetailList(String olseq) {
		
		try {
			
			String sql = "00";
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
