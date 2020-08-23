package com.test.user.product;

public class ProductDTO {

	private String seq; //상품번호
	private String name; //상품 이름
	private String shortdesc; //부제목
	private String content; //내용
	private String price; //가격
	private String img; //상품 이미지
	
	private String mseq; //회원번호
	
	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShortdesc() {
		return shortdesc;
	}

	public void setShortdesc(String shortdesc) {
		this.shortdesc = shortdesc;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getMseq() {
		return mseq;
	}

	public void setMseq(String mseq) {
		this.mseq = mseq;
	}

	
//	
//	private String name; // 회원이름
//	private String id;	// 회원아이디
	
}
