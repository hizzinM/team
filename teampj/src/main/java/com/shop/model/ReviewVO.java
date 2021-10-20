package com.shop.model;


import java.util.Date;
import java.util.List;

public class ReviewVO {
	private int reviewId;
	private String reviewTitle;
	private String productName;
	private String reviewBoard;
	private String userId;
	private Date reviewWritedate;
	
	private List<ReviewImg> imageList;
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	
	
	
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewVO(int reviewId, String reviewTitle, String productName, String reviewBoard, String userId,
			Date reviewWritedate) {
		super();
		this.reviewId = reviewId;
		this.reviewTitle = reviewTitle;
		this.productName = productName;
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

	public List<ReviewImg> getImageList() {
		return imageList;
	}

	public void setImageList(List<ReviewImg> imageList) {
		this.imageList = imageList;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewId=" + reviewId + ", reviewTitle=" + reviewTitle + ", productName=" + productName
				+ ", reviewBoard=" + reviewBoard + ", userId=" + userId + ", reviewWritedate=" + reviewWritedate
				+ ", imageList=" + imageList + ", fileName=" + fileName + ", uploadPath=" + uploadPath + ", uuid="
				+ uuid + "]";
	}

	

	

	

}