package com.shop.model;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class UserOrder {
	private int orderId;
	private String userId;
	private String orderPhone;
	private String orderAddress;
	private String orderAddressDetail;
	private String orderAddressNum;
	private int orderPrice;

	private List<OrderDetail> orderDetail;	
	
	public List<OrderDetail> getOrderDetail() {
		return orderDetail;
	} 	
	public void setOrderDetail(List<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime orderDate;
	public UserOrder(int orderId, String userId, String orderPhone, String orderAddress, String orderAddressDetail,
			String orderAddressNum, int orderPrice,LocalDateTime orderDate) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderAddressDetail = orderAddressDetail;
		this.orderAddressNum = orderAddressNum;
		this.orderPrice = orderPrice;
		
		this.orderDate = orderDate;
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
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderAddressDetail() {
		return orderAddressDetail;
	}
	public void setOrderAddressDetail(String orderAddressDetail) {
		this.orderAddressDetail = orderAddressDetail;
	}
	public String getOrderAddressNum() {
		return orderAddressNum;
	}
	public void setOrderAddressNum(String orderAddressNum) {
		this.orderAddressNum = orderAddressNum;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public LocalDateTime getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(LocalDateTime orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "UserOrder [orderId=" + orderId + ", userId=" + userId + ", orderPhone=" + orderPhone
				+ ", orderAddress=" + orderAddress + ", orderAddressDetail=" + orderAddressDetail + ", orderAddressNum="
				+ orderAddressNum + ", orderPrice=" + orderPrice + ", orderDate=" + orderDate + ", orderDetail=" + orderDetail + "]";
	}
	
	
}
