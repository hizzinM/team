package com.shop.model;

import java.util.Date;

public class Review {
	private int review_id;
	private String review_title;
	private String product_name;
	private String product_img;
	private String review_board;
	private String user_id;
	private Date review_writedate;
	
	public Review() {
		super();
	}
	public Review(int review_id, String review_title, String product_name, String product_img, String review_board,
			String user_id, Date review_writedate) {
		super();
		this.review_id = review_id;
		this.review_title = review_title;
		this.product_name = product_name;
		this.product_img = product_img;
		this.review_board = review_board;
		this.user_id = user_id;
		this.review_writedate = review_writedate;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getReview_board() {
		return review_board;
	}
	public void setReview_board(String review_board) {
		this.review_board = review_board;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getReview_writedate() {
		return review_writedate;
	}
	public void setReview_writedate(Date review_writedate) {
		this.review_writedate = review_writedate;
	}
	
	@Override
	public String toString() {
		return "Review [review_id=" + review_id + ", review_title=" + review_title + ", product_name=" + product_name
				+ ", product_img=" + product_img + ", review_board=" + review_board + ", user_id=" + user_id
				+ ", review_writedate=" + review_writedate + "]";
	}

	
}
