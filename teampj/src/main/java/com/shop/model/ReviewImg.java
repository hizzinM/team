package com.shop.model;

public class ReviewImg {

	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 상품 id */
	private int reviewId;

	public ReviewImg(String uploadPath, String uuid, String fileName, int reviewId) {
		super();
		this.uploadPath = uploadPath;
		this.uuid = uuid;
		this.fileName = fileName;
		this.reviewId = reviewId;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	@Override
	public String toString() {
		return "ReviewImg [uploadPath=" + uploadPath + ", uuid=" + uuid + ", fileName=" + fileName + ", reviewId="
				+ reviewId + "]";
	}

	public ReviewImg() {
		super();
	}
	
	
	
}
