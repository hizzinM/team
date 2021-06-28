package com.shop.service;

import com.shop.model.User;

public interface MemberService {

	// 회원가입
	public void memberJoin(User user) throws Exception;

	// 로그인
	public User memberLogin(User user) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;

	// 회원정보수정
	public void memberUpdate(User user) throws Exception;

}