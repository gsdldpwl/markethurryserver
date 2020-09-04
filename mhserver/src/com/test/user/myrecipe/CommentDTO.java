package com.test.user.myrecipe;

/**
 * 나만의 레시피의 댓글 구현 부분에서 commentrecipe 데이터를 불러오는 클래스입니다.
 * @author 장소진
 *
 */
public class CommentDTO {

	private String seq;
	private String content;
	private String regdate;
	private String receipeseq;
	private String memberID;
	private String mseq;

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

	public String getReceipeseq() {
		return receipeseq;
	}

	public void setReceipeseq(String receipeseq) {
		this.receipeseq = receipeseq;
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

	public String getMseq() {
		return mseq;
	}

	public void setMseq(String mseq) {
		this.mseq = mseq;
	}

}
