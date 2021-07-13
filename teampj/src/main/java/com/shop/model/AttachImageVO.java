package com.shop.model;

public class AttachImageVO {
	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 상품 id */
	private int productId;
	
	private int imageId;
	
	
	
	
	public AttachImageVO() {}




	public AttachImageVO(String uploadPath, String uuid, String fileName, int productId, int imageId) {
		super();
		this.uploadPath = uploadPath;
		this.uuid = uuid;
		this.fileName = fileName;
		this.productId = productId;
		this.imageId = imageId;
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




	public int getProductId() {
		return productId;
	}




	public void setProductId(int productId) {
		this.productId = productId;
	}




	public int getImageId() {
		return imageId;
	}




	public void setImageId(int imageId) {
		this.imageId = imageId;
	}




	@Override
	public String toString() {
		return "AttachImageVO [uploadPath=" + uploadPath + ", uuid=" + uuid + ", fileName=" + fileName + ", productId="
				+ productId + ", imageId=" + imageId + "]";
	}






	



	
}
