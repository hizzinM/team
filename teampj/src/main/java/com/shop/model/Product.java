package com.shop.model;

public class Product {
	private int productId;
	private String productName;
	private String productImg;
	private String productPrice;
	private String productSize;
	private String productColor;
	private int productInventory;
	public Product(int productId, String productName, String productImg, String productPrice, String productSize,
			String productColor, int productInventory) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImg = productImg;
		this.productPrice = productPrice;
		this.productSize = productSize;
		this.productColor = productColor;
		this.productInventory = productInventory;
	}
	public Product() {
		super();
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
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
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
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productImg=" + productImg
				+ ", productPrice=" + productPrice + ", productSize=" + productSize + ", productColor=" + productColor
				+ ", productInventory=" + productInventory + "]";
	}
}

