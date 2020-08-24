package com.test.user.mypage;

public class OrderListDTO {
	
	private String dseq;	//배송번호
	private String olseq;	//주문번호
	private String odseq;	//주문상세번호
	private String mseq;	//회원번호
	private String pseq;	//상품번호
	private String totalprice;	//주문전체가격
	private String price;		//상품가격
	private String pname;	//상품이름
	private String img;		//상품이미지
	private int qty;		//상품구매갯수
	private String regdate;	//등록날짜
	private String status;		//배송상태
	private int category;	//취소교환환불상태
	private String dregdate;//배송완료날짜
	
	public String getDseq() {
		return dseq;
	}
	public void setDseq(String dseq) {
		this.dseq = dseq;
	}
	public String getOlseq() {
		return olseq;
	}
	public void setOlseq(String olseq) {
		this.olseq = olseq;
	}
	public String getMseq() {
		return mseq;
	}
	public void setMseq(String mseq) {
		this.mseq = mseq;
	}
	public String getPseq() {
		return pseq;
	}
	public void setPseq(String pseq) {
		this.pseq = pseq;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getDregdate() {
		return dregdate;
	}
	public void setDregdate(String dregdate) {
		this.dregdate = dregdate;
	}
	public String getOdseq() {
		return odseq;
	}
	public void setOdseq(String odseq) {
		this.odseq = odseq;
	}
	
}
