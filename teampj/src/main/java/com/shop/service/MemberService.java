package com.shop.service;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.shop.model.User;

public interface MemberService {

	// 회원가입
	public void memberJoin(User user) throws Exception;

	// 로그인
	public User memberLogin(User user) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;

	public String findid(HttpServletResponse response, String email) throws Exception;

	public User getProfile(String userId);

	// 회원정보수정
	public int profileUpdate(User user);
}