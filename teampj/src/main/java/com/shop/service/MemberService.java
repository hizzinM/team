package com.shop.service;

import com.shop.model.User;

public interface MemberService {
	public void memberJoin(User user) throws Exception;

	/* 로그인 */
	public User memberLogin(User user) throws Exception;
}