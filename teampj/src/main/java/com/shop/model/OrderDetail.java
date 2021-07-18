package com.shop.model;

public class OrderDetail {
	private String orderDetailId;	
	private String orderId;
	private String productId;
	private String productName;
	private String orderSize;
	private String detailPrice;
	private String orderColor;
	private String orderQty;
	private String uploadPath;
	private String uuid;
	private String fileName;
	
	public OrderDetail(String orderDetailId, String orderId, String productId, String productName, String orderSize,
			String detailPrice, String orderColor, String orderQty) {
		super();
		this.orderDetailId = orderDetailId;
		this.orderId = orderId;
		this.productId = productId;
		this.productName = productName;
		this.orderSize = orderSize;
		this.detailPrice = detailPrice;
		this.orderColor = orderColor;
		this.orderQty = orderQty;
	}

	public String getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(String orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
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

	public String getDetailPrice() {
		return detailPrice;
	}

	public void setDetailPrice(String detailPrice) {
		this.detailPrice = detailPrice;
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

	

	public OrderDetail() {
		super();
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

	@Override
	public String toString() {
		return "OrderDetail [orderDetailId=" + orderDetailId + ", orderId=" + orderId + ", productId=" + productId
				+ ", productName=" + productName + ", orderSize=" + orderSize + ", detailPrice=" + detailPrice
				+ ", orderColor=" + orderColor + ", orderQty=" + orderQty + ", uploadPath=" + uploadPath + ", uuid="
				+ uuid + ", fileName=" + fileName + "]";
	}
	
	
	
	
}
