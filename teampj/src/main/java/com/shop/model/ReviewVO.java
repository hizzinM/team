package com.shop.model;

import java.util.Date;

public class ReviewVO {
	private int reviewId;
	private String reviewTitle;
	private String productName;
	private String productImg;
	private String reviewBoard;
	private String userId;
	private Date reviewWritedate;
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewVO(int reviewId, String reviewTitle, String productName, String productImg, String reviewBoard,
			String userId, Date reviewWritedate) {
		super();
		this.reviewId = reviewId;
		this.reviewTitle = reviewTitle;
		this.productName = productName;
		this.productImg = productImg;
		this.reviewBoard = reviewBoard;
		this.userId = userId;
		this.reviewWritedate = reviewWritedate;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getReviewBoard() {
		return reviewBoard;
	}
	public void setReviewBoard(String reviewBoard) {
		this.reviewBoard = reviewBoard;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getReviewWritedate() {
		return reviewWritedate;
	}
	public void setReviewWritedate(Date reviewWritedate) {
		this.reviewWritedate = reviewWritedate;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewId=" + reviewId + ", reviewTitle=" + reviewTitle + ", productName=" + productName
				+ ", productImg=" + productImg + ", reviewBoard=" + reviewBoard + ", userId=" + userId
				+ ", reviewWritedate=" + reviewWritedate + "]";
	}

}
