package com.test.user.customercenter;

/**
 * @author leeho
 * 1:1 문의 DTO
 */
public class OnebyoneDTO {
	
	private String seq;
	private String orderseq;
	private String category;
	private String title;
	private String content;
	private String filepath;
	private String inquirydate;
	private String answercontent;
	private String answerdate;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getOrderseq() {
		return orderseq;
	}
	public void setOrderseq(String orderseq) {
		this.orderseq = orderseq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getInquirydate() {
		return inquirydate;
	}
	public void setInquirydate(String inquirydate) {
		this.inquirydate = inquirydate;
	}
	public String getAnswercontent() {
		return answercontent;
	}
	public void setAnswercontent(String answercontent) {
		this.answercontent = answercontent;
	}
	public String getAnswerdate() {
		return answerdate;
	}
	public void setAnswerdate(String answerdate) {
		this.answerdate = answerdate;
	}
	
	
}
