package com.shop.service;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.MemberMapper;
import com.shop.model.Criteria;
import com.shop.model.OrderDetail;
import com.shop.model.ShoppingCart;
import com.shop.model.User;
import com.shop.model.UserOrder;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper membermapper;
	@Autowired
	MemberServiceImpl mpl;

	// 회원가입
	@Override
	public void memberJoin(User user) throws Exception {
		membermapper.memberJoin(user);
	}

	// 로그인
	@Override
	public User memberLogin(User user) {
		return membermapper.memberLogin(user);
	}

	// 아이디 찾기
	@Override
	public String findid(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userid = membermapper.findid(email);

		if (userid == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return userid;
		}
	}

	// 아이디 중복체크
	@Override
	public int idCheck(String memberId) throws Exception {
		return membermapper.idCheck(memberId);
	}

	// 회원목록 조회
	@Override
	public List<User> getmemberList() {
		return membermapper.getmemberList();
	}

	// 페이징
	@Override
	public List<User> getListPaging(Criteria cri) {
		return membermapper.getListPaging(cri);
	}

	// 총회원수
	@Override
	public int getTotal(Criteria cri) {
		return membermapper.getTotal(cri);
	}

	// 회원정보 조회
	@Override
	public User getProfile(String userId) {
		return membermapper.getProfile(userId);
	}

	// 회원정보 수정
	@Override
	public int profileUpdate(User user) {
		return membermapper.profileUpdate(user);
	}

	// 회원정보 삭제
	@Override
	public int profileDelete(User user) {
		return membermapper.profileDelete(user);
	}
	//장바구니 추가
	@Override
	public void addCart(ShoppingCart cart) throws Exception{
		 membermapper.addCart(cart);
	}
	//장바구니 목록
	@Override
	public List<ShoppingCart> selectCart(String userId)  throws Exception{
		return membermapper.selectCart(userId);
		
	}
	//장바구니 삭제
	@Override
	public int deleteCart(String cartId) {
		
		return membermapper.deleteCart(cartId);
	}
	//장바구니 간단 조회
	@Override
	public ShoppingCart selectCartId(String cartId) {
		return membermapper.selectCartId(cartId);
	}
	//장바구니 수량 변경
	@Override
	public int updateCartQty(ShoppingCart cart) {
		
		return membermapper.updateCartQty(cart);
	}

	@Override
	public void orderinsert(UserOrder order) throws Exception {
			membermapper.orderinsert(order);
	}

	@Override
	public void orderinsertDetail(OrderDetail detail) throws Exception {
		membermapper.orderinsertDetail(detail);
		
	}

	@Override
	public List<UserOrder> orderList(UserOrder order) throws Exception {
		
		return membermapper.orderList(order);
	}
	
}
