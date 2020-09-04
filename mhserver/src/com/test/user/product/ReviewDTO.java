package com.test.user.product;

/**
 * @author 이예지
 * 상품후기관련, 배송과 회원 관련 정보도 포함
 *
 */
public class ReviewDTO {

	private String seq; //리뷰 번호
	private String orderdetailseq; //주문상세번호
	private String title;	//리뷰 제목
	private String content; //리뷰 내용
	private String image; //리뷰 이미지
	private String regdate; //리뷰 작성일
	private int readcount; //리뷰 조회수
	
	
	private String name; //작성자 이름
	private String id;
	private String rownum;
	
	
	private String orderseq; //주문번호
	private String status; //배송상태
	private String deliverycomplete; //배송완료날짜
	private String memberseq; //회원번호
	private String productseq; //상품번호

	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDeliverycomplete() {
		return deliverycomplete;
	}
	public void setDeliverycomplete(String deliverycomplete) {
		this.deliverycomplete = deliverycomplete;
	}
	public String getMemberseq() {
		return memberseq;
	}
	public void setMemberseq(String memberseq) {
		this.memberseq = memberseq;
	}
	public String getProductseq() {
		return productseq;
	}
	public void setProductseq(String productseq) {
		this.productseq = productseq;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getOrderdetailseq() {
		return orderdetailseq;
	}
	public void setOrderdetailseq(String orderdetailseq) {
		this.orderdetailseq = orderdetailseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderseq() {
		return orderseq;
	}
	public void setOrderseq(String orderseq) {
		this.orderseq = orderseq;
	}
	
}
