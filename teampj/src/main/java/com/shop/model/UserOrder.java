package com.shop.model;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class UserOrder {
	private String orderId;
	private String userId;
	private String userName;
	private String orderPhone;
	private String orderAddress;
	private String orderAddressDetail;
	private String orderAddressNum;
	private int orderPrice;
	private List<OrderDetail> orderDetailList;
	
	private String orderDate;

	public UserOrder(String orderId, String userId, String userName, String orderPhone, String orderAddress,
			String orderAddressDetail, String orderAddressNum, int orderPrice, String orderDate) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.userName = userName;
		this.orderPhone = orderPhone;
		this.orderAddress = orderAddress;
		this.orderAddressDetail = orderAddressDetail;
		this.orderAddressNum = orderAddressNum;
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public List<OrderDetail> getOrderDetailList() {
		return orderDetailList;
	}

	public void setOrderDetailList(List<OrderDetail> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "UserOrder [orderId=" + orderId + ", userId=" + userId + ", userName=" + userName + ", orderPhone="
				+ orderPhone + ", orderAddress=" + orderAddress + ", orderAddressDetail=" + orderAddressDetail
				+ ", orderAddressNum=" + orderAddressNum + ", orderPrice=" + orderPrice + ", orderDetailList="
				+ orderDetailList + ", orderDate=" + orderDate + "]";
	}

	public UserOrder() {
		super();
	}
	
	
	
}
