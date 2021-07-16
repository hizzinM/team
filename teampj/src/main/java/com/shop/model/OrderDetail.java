package com.shop.model;

public class OrderDetail {
	private int orderDetailId;	
	private String orderId;
	
	private String productName;
	private String orderSize;
	private String orderInventory;
	public OrderDetail(int orderDetailId, String orderId, String productName, String orderSize,
			String orderInventory) {
		super();
		this.orderDetailId = orderDetailId;
		this.orderId = orderId;
	
		this.productName = productName;
		this.orderSize = orderSize;
		this.orderInventory = orderInventory;
	}
	public int getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOrderSize() {
		return orderSize;
	}
	public void setOrderSize(String orderSize) {
		this.orderSize = orderSize;
	}
	public String getOrderInventory() {
		return orderInventory;
	}
	public void setOrderInventory(String orderInventory) {
		this.orderInventory = orderInventory;
	}
	@Override
	public String toString() {
		return "OrderDetail [orderDetailId=" + orderDetailId + ", orderId=" + orderId + ", productName=" + productName + ", orderSize=" + orderSize + ", orderInventory=" + orderInventory
				+ "]";
	}
	
	
	
}
