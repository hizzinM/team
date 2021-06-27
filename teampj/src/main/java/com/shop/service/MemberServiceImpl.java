package com.shop.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.MemberMapper;
import com.shop.model.User;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper membermapper;

	// 회원가입
	@Override
	public void memberJoin(User user) throws Exception {

		membermapper.memberJoin(user);

	}

	// 로그인
	@Override
	public User memberLogin(User user) throws Exception {

		return membermapper.memberLogin(user);
	}
	


	// 아이디 중복체크
	@Override
	public int idCheck(String memberId) throws Exception {

		return membermapper.idCheck(memberId);
	}

	@Override
	public void memberUpdate(User user) throws Exception {

		membermapper.memberUpdate(user);
	}

	

}
