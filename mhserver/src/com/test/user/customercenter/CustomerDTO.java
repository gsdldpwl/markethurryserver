package com.test.user.customercenter;

/**
 * @author 이예지
 * 고객센터 - 공지사항 관련
 *
 */
public class CustomerDTO {
	

	private String seq; //공지사항 번호
	private String title; //공지사항 제목
	private String content; //공지사항 내용
	private String regdate; //공지사항 작성일
	private int readcount; //공지사항 조회수
	
	private String mseq; //?
	
	private String name; // 회원이름
	private String id;	// 회원아이디
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
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
	public String getMseq() {
		return mseq;
	}
	public void setMseq(String mseq) {
		this.mseq = mseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	

}
