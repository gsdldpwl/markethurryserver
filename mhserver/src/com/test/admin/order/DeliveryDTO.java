package com.test.admin.order;

public class DeliveryDTO {

	private String order_regdate;		//주문일(결제일)
	private String order_seq;			//주문번호
	private String order_name;			//주문자
	private String product_name;		//상품명
	private String product_qty;			//수량
	private String order_price;			//총 결제금액
	private String delivery_category;	//분류
	private String delivery_status;		//상태
	private String delivery_regdate;	//배송날짜
	
	public String getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(String order_regdate) {
		this.order_regdate = order_regdate;
	}
	public String getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(String order_seq) {
		this.order_seq = order_seq;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_qty() {
		return product_qty;
	}
	public void setProduct_qty(String product_qty) {
		this.product_qty = product_qty;
	}
	public String getOrder_price() {
		return order_price;
	}
	public void setOrder_price(String order_price) {
		this.order_price = order_price;
	}
	public String getDelivery_category() {
		return delivery_category;
	}
	public void setDelivery_category(String delivery_category) {
		this.delivery_category = delivery_category;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public String getDelivery_regdate() {
		return delivery_regdate;
	}
	public void setDelivery_regdate(String delivery_regdate) {
		this.delivery_regdate = delivery_regdate;
	}
	
}