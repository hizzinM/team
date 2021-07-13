package com.shop.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.shop.model.Criteria;
import com.shop.model.ShoppingCart;
import com.shop.model.User;

public interface MemberService {

	// 회원가입
	public void memberJoin(User user) throws Exception;

	// 로그인
	public User memberLogin(User user);

	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;

	// 아이디 찾기
	public String findid(HttpServletResponse response, String email) throws Exception;

	// 회원목록 조회
	public List<User> getmemberList();

	// 페이징
	public List<User> getListPaging(Criteria cri);
	
	//총회원수 
    public int getTotal(Criteria cri);

	// 회원정보 조회
	public User getProfile(String userId);

	// 회원정보수정
	public int profileUpdate(User user); 

	// 회원정보 삭제
	public int profileDelete(User user);
	//카트담기
	public void addCart(ShoppingCart cart) throws Exception;
	//장바구니 리스트
	public List<ShoppingCart> selectCart(String userId)  throws Exception;
	// 장바구니 삭제 기능
	public int deleteCart(String cartId);
}