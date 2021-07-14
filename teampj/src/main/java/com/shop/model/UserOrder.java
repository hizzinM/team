package com.shop.model;

public class UserOrder {
	private int orderId;
	private String userId;
	private String productName;
	private int orderPrice;
	private int orderInventory;
	private String orderSize;
	private String orderDate;
	public UserOrder(int orderId, String userId, String productName, int orderPrice, int orderInventory,
			String orderSize, String orderDate) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.productName = productName;
		this.orderPrice = orderPrice;
		this.orderInventory = orderInventory;
		this.orderSize = orderSize;
		this.orderDate = orderDate;
	}
	public UserOrder() {
		super();
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
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
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getOrderInventory() {
		return orderInventory;
	}
	public void setOrderInventory(int orderInventory) {
		this.orderInventory = orderInventory;
	}
	public String getOrderSize() {
		return orderSize;
	}
	public void setOrderSize(String orderSize) {
		this.orderSize = orderSize;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "UserOrder [orderId=" + orderId + ", userId=" + userId + ", productName=" + productName + ", orderPrice="
				+ orderPrice + ", orderInventory=" + orderInventory + ", orderSize=" + orderSize + ", orderDate="
				+ orderDate + "]";
	}
	
}
