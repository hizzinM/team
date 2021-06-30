package com.shop.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component
public class User {
	private String userId;
	private String password;
	private String passwordCheck;
	private String userName;
	private String addressNum;
	private String address;
	private String addressDetail;
	private String phone;
	private String email;
	private int adminck; 
	private Date regDate;

	private String accountName;
	private String accountBank;
	private String accountNum;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String password, String passwordCheck, String userName, String addressNum,
			String address, String addressDetail, String phone, String email, int adminck, Date regDate,
			String accountName, String accountBank, String accountNum) {
		super();
		this.userId = userId;
		this.password = password;
		this.passwordCheck = passwordCheck;
		this.userName = userName;
		this.addressNum = addressNum;
		this.address = address;
		this.addressDetail = addressDetail;
		this.phone = phone;
		this.email = email;
		this.adminck = adminck;
		this.regDate = regDate;
		this.accountName = accountName;
		this.accountBank = accountBank;
		this.accountNum = accountNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordCheck() {
		return passwordCheck;
	}

	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAdminck() {
		return adminck;
	}

	public void setAdminck(int adminck) {
		this.adminck = adminck;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountBank() {
		return accountBank;
	}

	public void setAccountBank(String accountBank) {
		this.accountBank = accountBank;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", passwordCheck=" + passwordCheck + ", userName="
				+ userName + ", addressNum=" + addressNum + ", address=" + address + ", addressDetail=" + addressDetail
				+ ", phone=" + phone + ", email=" + email + ", adminck=" + adminck + ", regDate=" + regDate
				+ ", accountName=" + accountName + ", accountBank=" + accountBank + ", accountNum=" + accountNum + "]";
	}

}
