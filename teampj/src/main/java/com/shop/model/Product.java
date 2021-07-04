package com.shop.model;

import java.util.List;

public class Product {
	private int productId;
	private String productName;
	private String productPrice;
	private String productSize;
	private String productColor;
	private int productInventory;
	private String fileName;
	private String uploadPath;
	private String uuid;
	private int[] noList;
	private List<AttachImageVO> imageList;
	public Product() {
		super();
	}
	public Product(int productId, String productName, String productPrice, String productSize, String productColor,
			int productInventory) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productSize = productSize;
		this.productColor = productColor;
		this.productInventory = productInventory;
	
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
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
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
	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	public int[] getNoList() {
		return noList;
	}
	public void setNoList(int[] noList) {
		this.noList = noList;
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productSize=" + productSize + ", productColor=" + productColor + ", productInventory="
				+ productInventory + ", fileName=" + fileName + ", uploadPath=" + uploadPath + ", uuid=" + uuid
				+ ", imageList=" + imageList + "]";
	}
	
	
}