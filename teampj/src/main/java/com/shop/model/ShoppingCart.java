package com.shop.model;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class ShoppingCart {
	private int cartId;
	private String userId;
	private String productName;
	private String cartProductsize;
	private String cartProductColor;
	private String cartProductOption;
	private int cartPrice;
	private int cartQty;
	private String fileName;
	private String uploadPath;
	private String uuid;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime cartUpdate;
	
	
	public ShoppingCart() {
		super();
	}

	public ShoppingCart(int cartId, String userId, String productName, String cartProductsize, String cartProductColor,
			String cartProductOption, int cartPrice, int cartQty, LocalDateTime cartUpdate) {
		super();
		this.cartId = cartId;
		this.userId = userId;
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
		return "ShoppingCart [cartId=" + cartId + ", userId=" + userId + ", productName=" + productName
				+ ", cartProductsize=" + cartProductsize + ", cartProductColor=" + cartProductColor
				+ ", cartProductOption=" + cartProductOption + ", cartPrice=" + cartPrice + ", cartQty=" + cartQty
				+ ", fileName=" + fileName + ", uploadPath=" + uploadPath + ", uuid=" + uuid + ", cartUpdate="
				+ cartUpdate + "]";
	}

	
	
}
