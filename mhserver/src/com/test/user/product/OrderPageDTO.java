package com.test.user.product;

/**
 * @author 정희수
 *주문서에 들어갈 회원정보 + 상품정보를 가져오는 DTO클래스입니다.
 */
public class OrderPageDTO {

	private String proname;				//상품 이름
	private String proprice;			//상품 가격
	private String proqty;				//상품 수량
	private String memseq;				//회원 번호
	private String memname;				//회원 이름
	private String memtel;				//회원 전화번호
	private String mememail;			//회원 이메일
	private String memaddress;			//회원 주소
	private String memmile;				//회원 마일리지
	
	
	
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getProprice() {
		return proprice;
	}
	public void setProprice(String proprice) {
		this.proprice = proprice;
	}
	public String getProqty() {
		return proqty;
	}
	public void setProqty(String proqty) {
		this.proqty = proqty;
	}
	
	
	public String getMemseq() {
		return memseq;
	}
	public void setMemseq(String memseq) {
		this.memseq = memseq;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemtel() {
		return memtel;
	}
	public void setMemtel(String memtel) {
		this.memtel = memtel;
	}
	public String getMememail() {
		return mememail;
	}
	public void setMememail(String mememail) {
		this.mememail = mememail;
	}
	public String getMemaddress() {
		return memaddress;
	}
	public void setMemaddress(String memaddress) {
		this.memaddress = memaddress;
	}
	
	public String getMemmile() {
		return memmile;
	}
	public void setMemmile(String memmile) {
		this.memmile = memmile;
	}
	
	
	
}
