package com.shop.model;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class ShoppingCart {
	private int cartId;
	private String userId;
	private int productId;
	private String productName;
	private String cartProductsize;
	private String cartProductColor;
	private String cartProductOption;
	private int cartPrice;
	private int cartQty;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime cartUpdate;
	private String userName;
	private String fileName;
	private String uploadPath;
	private String uuid;
	private String addressNum;
	private String address;
	private String addressDetail;
	private String phone;
	
	
	
	public ShoppingCart() {
		super();
	}

	

	public ShoppingCart(int cartId, String userId, int productId, String productName, String cartProductsize,
			String cartProductColor, String cartProductOption, int cartPrice, int cartQty, LocalDateTime cartUpdate) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.productId = productId;
		this.productName = productName;
		this.cartProductsize = cartProductsize;
		this.cartProductColor = cartProductColor;
		this.cartProductOption = cartProductOption;
		this.cartPrice = cartPrice;
		this.cartQty = cartQty;
		this.cartUpdate = cartUpdate;
	}



	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getCartProductsize() {
		return cartProductsize;
	}

	public void setCartProductsize(String cartProductsize) {
		this.cartProductsize = cartProductsize;
	}

	public String getCartProductColor() {
		return cartProductColor;
	}

	public void setCartProductColor(String cartProductColor) {
		this.cartProductColor = cartProductColor;
	}

	public String getCartProductOption() {
		return cartProductOption;
	}

	public void setCartProductOption(String cartProductOption) {
		this.cartProductOption = cartProductOption;
	}

	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}

	public int getCartQty() {
		return cartQty;
	}

	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}

	public LocalDateTime getCartUpdate() {
		return cartUpdate;
	}

	public void setCartUpdate(LocalDateTime cartUpdate) {
		this.cartUpdate = cartUpdate;
	}

	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
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



	public String getAddressNum() {
		return addressNum;
	}



	public void setAddressNum(String addressNum) {
		this.addressNum = addressNum;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getAddressDetail() {
		return addressDetail;
	}



	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	@Override
	public String toString() {
		return "ShoppingCart [cartId=" + cartId + ", userId=" + userId + ", productId=" + productId + ", productName="
				+ productName + ", cartProductsize=" + cartProductsize + ", cartProductColor=" + cartProductColor
				+ ", cartProductOption=" + cartProductOption + ", cartPrice=" + cartPrice + ", cartQty=" + cartQty
				+ ", cartUpdate=" + cartUpdate + ", userName=" + userName + ", fileName=" + fileName + ", uploadPath="
				+ uploadPath + ", uuid=" + uuid + ", addressNum=" + addressNum + ", address=" + address
				+ ", addressDetail=" + addressDetail + ", phone=" + phone + "]";
	}



	



	

	

	
	
}
