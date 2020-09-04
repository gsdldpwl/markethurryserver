package com.test.user.product;

/**
 * @author 정희수
 *상품과 관련된 모든 것을 불러오는 DTO클래스입니다.
 */
public class ProductlistDTO {

	private String seq; 			//상품목록 번호
	private String name; 			//상품 이름
	private String shortdesc; 		//상품 부제
	private String content; 		//상품 내용
	private String category; 		//상품 분류
	private String price; 			//상품 가격
	private String regdate; 		//상품 등록날짜
	private String img; 			//상품 이미지
	private int sales; 				//상품 판매량

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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

}// class
