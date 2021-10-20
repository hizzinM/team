package com.shop.model;

import java.util.List;

public class Product {
	private int productId;
	private String productName;
	private int productPrice;
	private String productSize;
	private String productCategory;
	private String productColor;
	private int productInventory;
	private String productComment;
	private String fileName;
	private String uploadPath;
	private String uuid;
	private String fileName2;
	private String uploadPath2;
	private String uuid2;
	
	private String fileName3;
	private String uploadPath3;
	private String uuid3;
	
	private String fileName4;
	private String uploadPath4;
	private String uuid4;
	private List<AttachImageVO> imageList;

	public Product() {
		super();
	}

	public Product(int productId, String productName, int productPrice, String productSize, String productCategory,
			String productColor, int productInventory, String productComment) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productSize = productSize;
		this.productCategory = productCategory;
		this.productColor = productColor;
		this.productInventory = productInventory;
		this.productComment = productComment;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductColor() {
		return productColor;
	}

	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}

	public int getProductInventory() {
		return productInventory;
	}

	public void setProductInventory(int productInventory) {
		this.productInventory = productInventory;
	}

	public String getProductComment() {
		return productComment;
	}

	public void setProductComment(String productComment) {
		this.productComment = productComment;
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

	public List<AttachImageVO> getImageList() {
		return imageList;
	} 
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public String getUploadPath2() {
		return uploadPath2;
	}
	public String getFileName3() {
		return fileName3;
	}

	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}

	public String getUploadPath3() {
		return uploadPath3;
	}

	public void setUploadPath3(String uploadPath3) {
		this.uploadPath3 = uploadPath3;
	}

	public String getUuid3() {
		return uuid3;
	}

	public void setUuid3(String uuid3) {
		this.uuid3 = uuid3;
	}

	public String getFileName4() {
		return fileName4;
	}

	public void setFileName4(String fileName4) {
		this.fileName4 = fileName4;
	}

	public String getUploadPath4() {
		return uploadPath4;
	}

	public void setUploadPath4(String uploadPath4) {
		this.uploadPath4 = uploadPath4;
	}

	public String getUuid4() {
		return uuid4;
	}

	public void setUuid4(String uuid4) {
		this.uuid4 = uuid4;
	}

	public void setUploadPath2(String uploadPath2) {
		this.uploadPath2 = uploadPath2;
	}
	public String getUuid2() {
		return uuid2;
	}
	public void setUuid2(String uuid2) {
		this.uuid2 = uuid2;
	} 
	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productSize=" + productSize + ", productCategory=" + productCategory + ", productColor="
				+ productColor + ", productInventory=" + productInventory + ", productComment=" + productComment
				+ ", fileName=" + fileName + ", uploadPath=" + uploadPath + ", uuid=" + uuid + ", fileName2="
				+ fileName2 + ", uploadPath2=" + uploadPath2 + ", uuid2=" + uuid2 + ", fileName3=" + fileName3
				+ ", uploadPath3=" + uploadPath3 + ", uuid3=" + uuid3 + ", fileName4=" + fileName4 + ", uploadPath4="
				+ uploadPath4 + ", uuid4=" + uuid4 + ", imageList=" + imageList + "]";
	}

	
}