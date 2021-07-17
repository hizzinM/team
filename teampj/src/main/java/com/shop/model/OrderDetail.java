package com.shop.model;

public class OrderDetail {
	private int orderDetailId;	
	private int orderId;
	private String productId;
	private String productName;
	private String orderSize;
	private String orderlPrice;
	private String orderColor;
	private String orderQty;
	
	public OrderDetail(int orderDetailId, int orderId, String productId, String productName, String orderSize,
			String orderlPrice, String orderColor, String orderQty) {
		super();
		this.orderDetailId = orderDetailId;
		this.orderId = orderId;
		this.productId = productId;
		this.productName = productName;
		this.orderSize = orderSize;
		this.orderlPrice = orderlPrice;
		this.orderColor = orderColor;
		this.orderQty = orderQty;
	}

	public int getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
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

	public String getOrderlPrice() {
		return orderlPrice;
	}

	public void setOrderlPrice(String orderlPrice) {
		this.orderlPrice = orderlPrice;
	}

	public String getOrderColor() {
		return orderColor;
	}

	public void setOrderColor(String orderColor) {
		this.orderColor = orderColor;
	}

	public String getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(String orderQty) {
		this.orderQty = orderQty;
	}

	@Override
	public String toString() {
		return "OrderDetail [orderDetailId=" + orderDetailId + ", orderId=" + orderId + ", productId=" + productId
				+ ", productName=" + productName + ", orderSize=" + orderSize + ", orderlPrice=" + orderlPrice
				+ ", orderColor=" + orderColor + ", orderQty=" + orderQty + "]";
	}
	
	
	
	
}
