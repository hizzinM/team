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
				+ fileName2 + ", uploadPath2=" + uploadPath2 + ", uuid2=" + uuid2 + ", imageList=" + imageList + "]";
	} 
}