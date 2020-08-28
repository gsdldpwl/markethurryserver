package com.test.user.myrecipe;


public class RecipeDTO {

	private String seq; //레피시seq
	private String category;
	private String title;
	private String content;
	private String regdate;
	private int readCount;
	private String img;
	private String memberID;
	private String mseq;  //member seq
	private String cseq; //comment seq
	private String cpseq; //combiproduct seq
	

	public String getCpseq() {
		return cpseq;
	}

	public void setCpseq(String cpseq) {
		this.cpseq = cpseq;
	}

	public String getCseq() {
		return cseq;
	}

	public void setCseq(String cseq) {
		this.cseq = cseq;
	}

	public String getMseq() {
		return mseq;
	}

	public void setMseq(String mseq) {
		this.mseq = mseq;
	}

	public String getSeq() {
		return seq;
	}
	
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

	

}
