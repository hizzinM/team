package com.shop.mapper;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.shop.model.Criteria;
import com.shop.model.ShoppingCart;
import com.shop.model.User;

@Mapper
public interface MemberMapper {

	// 회원가입 기능
	public void memberJoin(User user);

	// 로그인 기능
	public User memberLogin(User user);

	// 아이디 중복 검사
	public int idCheck(String memberId);

	// 아이디 찾기 기능
	public String findid(String email);

	// 회원목록 조회
	public List<User> getmemberList();
 
	// 페이징
	public List<User> getListPaging(Criteria cri);

	// 총회원수
	public int getTotal(Criteria cri);

	// 회원정보 조회 기능
	public User getProfile(String userId);

	// 회원정보 수정 기능
	public int profileUpdate(User user);

	// 회원정보 삭제 기능
	public int profileDelete(User user);
	//카트담기
	public void addCart(ShoppingCart cart) throws Exception;
	
	//장바구니 리스트
	public List<ShoppingCart> selectCart(String userId)  throws Exception;
	// 장바구니 삭제 기능
	public int deleteCart(String cartId);

	
	// public User readMember(String userId);

	// public int updatePw(User user) throws Exception;
}