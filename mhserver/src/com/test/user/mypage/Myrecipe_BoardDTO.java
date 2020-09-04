package com.test.user.mypage;

/**
 * 마이페이지의 나만의 레시피 등록에 대해 필요한 데이터를 불러오는 클래스입니다.
 * 
 * @author 장소진
 *
 */
public class Myrecipe_BoardDTO {

	private String mseq; // 회원번호
	private String pname; // 상품이름
	private String pdate; // 상품 구매날짜
	private String pimg; // 상품이미지
	private String price;// 가격 멤버변수 만드시고
	private String pseq;// 상품seq 멤머변수

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPseq() {
		return pseq;
	}

	public void setPseq(String pseq) {
		this.pseq = pseq;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	public String getMseq() {
		return mseq;
	}

	public void setMseq(String mseq) {
		this.mseq = mseq;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

}
