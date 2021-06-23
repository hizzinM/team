package com.shop.model;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

@Component
public class User {
	private int userNo;
	private String userId;
	private String password;
	private String passwordCheck;
	private String userName;
	private String address;
	private String phone;
	private String email;
	private LocalDate birthDate;
	private String accountName;
	private String accountBank;
	private String accountNum;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int userNo, String userId, String password, String passwordCheck, String userName, String address,
			String phone, String email, LocalDate birthDate, String accountName, String accountBank,
			String accountNum) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.password = password;
		this.passwordCheck = passwordCheck;
		this.userName = userName;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.birthDate = birthDate;
		this.accountName = accountName;
		this.accountBank = accountBank;
		this.accountNum = accountNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
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
		return "User [userNo=" + userNo + ", userId=" + userId + ", password=" + password + ", passwordCheck="
				+ passwordCheck + ", userName=" + userName + ", address=" + address + ", phone=" + phone + ", email="
				+ email + ", birthDate=" + birthDate + ", accountName=" + accountName + ", accountBank=" + accountBank
				+ ", accountNum=" + accountNum + "]";
	}

}
