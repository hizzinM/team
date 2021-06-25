package com.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.MemberMapper;
import com.shop.model.User;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper membermapper;

	@Override
	public void memberJoin(User user) throws Exception {

		membermapper.memberJoin(user);

	}

	/* 로그인 */
	@Override
	public User memberLogin(User user) throws Exception {

		return membermapper.memberLogin(user);
	}
}
