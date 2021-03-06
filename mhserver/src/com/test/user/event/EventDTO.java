package com.test.user.event;

/**
 * @author ks008
 * Event테이블과 데이터 교환을 위한 객체입니다.
 */
public class EventDTO {
	
	private String seq;			//이벤트 seq
	private String title;		//이벤트 제목
	private String img;			//이벤트 배너 이미지
	
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

}