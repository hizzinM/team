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
import com.shop.model.OrderDetail;
import com.shop.model.Product;
import com.shop.model.ShoppingCart;
import com.shop.model.User;
import com.shop.model.UserOrder;

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
	// 장바구니 물품 간단조회 기능
	public ShoppingCart selectCartId(String cartId);
	// 장바구니 물품 수량 수정 기능
	public int updateCartQty(ShoppingCart cart);
	
	//주문
	public void orderinsert(UserOrder order);
	//주문상세정보
	public void orderinsertDetail(OrderDetail detail);
	//주문목록
	public List<UserOrder> orderList(UserOrder order);
	//주문상세목록
	public List<OrderDetail> orderDetailList(UserOrder order) throws Exception;
	/* 상품삭제 */
	public int deleteOrder(String orderId);

	/* 상품이미지 전체삭제 */
	public int deleteOrderDetail(String orderId);
	
	// public User readMember(String userId);
	/*주문시 재고감소*/
	public void updateInven(Product product);
	/*주문취소 재고증가*/
	public void updateInvenPuls(Product product);
	//주문수정조회
	public UserOrder orderselect(String orderId);
		
	public int orderupdate(UserOrder order);

	

	// public int updatePw(User user) throws Exception;
}