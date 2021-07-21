package com.shop.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.mapper.MemberMapper;
import com.shop.model.Criteria;
import com.shop.model.OrderDetail;
import com.shop.model.PageMakerDTO;
import com.shop.model.Product;
import com.shop.model.ReviewVO;
import com.shop.model.ShoppingCart;
import com.shop.model.User;
import com.shop.model.UserOrder;
import com.shop.service.AdminService;
import com.shop.service.BoardService;
import com.shop.service.MemberService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	MemberMapper membermapper;
	@Autowired
	MemberService memberservice;
	@Autowired
	AdminService adminService;
	@Autowired
	BoardService boardService;

	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	// 마이페이지 이동
	@RequestMapping(value = "myindex", method = RequestMethod.GET)
	public void getmypage() throws Exception {
		logger.info("마이페이지 진입");
	}

	// 프로필 페이지 이동
	@GetMapping("/profile")
	public void getprofile(Model model, String userId) throws Exception {
		model.addAttribute("profile", membermapper.getProfile(userId));
	}

	/* 게시판 조회 */
	@GetMapping("/profileUpdate")
	public void profileUpdateGET(String userId, Model model) {
		model.addAttribute("profile", memberservice.getProfile(userId));
	}

	// 프로필 수정 기능
	@PostMapping("/profileUpdate")
	public String profileUpdatePOST(User user, RedirectAttributes rttr) {
		memberservice.profileUpdate(user);
		rttr.addFlashAttribute("profile", "modify success");
		return "redirect:/mypage/myindex";
	}
	// 이부분 선생님한테 질문하기 포스트 방식으로 폼도 보내고 페이지 이동하고 싶다면?

	// 회원 탈퇴 get
	@RequestMapping(value = "/profileDeleteView", method = RequestMethod.GET)
	public String profileDeleteView() throws Exception {
		return "mypage/profileDeleteView";
	}

	// 회원 삭제
	@RequestMapping(value = "/profileDelete", method = RequestMethod.POST)
	public String profileDeletePOST(User user, HttpSession session, RedirectAttributes rttr) {

		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		User loginuser = (User) session.getAttribute("loginuser");
		// 세션에 있는 비밀번호
		String sessionPass = loginuser.getPassword();
		// vo로 들어오는 비밀번호
		String voPass = user.getPassword();

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/mypage/profileDeleteView";
		}
		memberservice.profileDelete(user);
		session.invalidate();
		return "redirect:/main";
	}

	// 장바구니 진입
	@RequestMapping(value = "/addCart", method = RequestMethod.GET)
	public void GetaddCart(HttpSession session, Model model) throws Exception {
		logger.info("장바구니 진입");
		User loginuser = (User) session.getAttribute("loginuser");
		String userId = loginuser.getUserId();

		List<ShoppingCart> cartList = membermapper.selectCart(userId);

		model.addAttribute("cartList", cartList);

	}

	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public String addCart(ShoppingCart cart, HttpSession session) throws Exception {

		int result = 0;
		Product product = new Product();
		logger.info("카트 담기 진입");
		User user = (User) session.getAttribute("loginuser");

		if (user != null) {
			cart.setUserId(user.getUserId());
			cart.setCartUpdate(LocalDateTime.now());
			memberservice.addCart(cart);
			result = 1;
		}
		System.out.println(result);
		return String.valueOf(result);
	}

	// 카트 삭제
	@RequestMapping(value = "/deleteAddCart")
	public String CartDelete(HttpServletRequest request) throws Exception {
		logger.info("상품 선택삭제");
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			memberservice.deleteCart(String.valueOf(ajaxMsg[i]));
			System.out.println(ajaxMsg[i]);
		}
		return "redirect:/mypage/addCart";
	}

	// 장바구니 간단조회
	@GetMapping("/cartUpdate")
	public String cartQtyUpdate(String cartId, Model model) {
		logger.info("장바구니 간단조회 ");
		ShoppingCart result = memberservice.selectCartId(cartId);
		System.out.println(result);

		model.addAttribute("cart", memberservice.selectCartId(cartId));

		return "/mypage/cartUpdate";
	}

	// 장바구니수량 수정
	@PostMapping("/cartUpdate")
	public String cartQtyUpdatePOST(ShoppingCart cart, RedirectAttributes rttr, Model model) {
		logger.info("수량 수정 기능 ");
		memberservice.updateCartQty(cart);
		rttr.addFlashAttribute("cartQty", memberservice.updateCartQty(cart));

		return "redirect:/mypage/addCart";
	}
	// 주문 목록

	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, UserOrder order, Model model) throws Exception {
		logger.info("주문리스트 진입");
		User user = (User) session.getAttribute("loginuser");
		String userId = user.getUserId();
		// UserOrder order = new UserOrder();
		order.setUserId(userId);

		List<UserOrder> orderList = memberservice.orderList(order);

		model.addAttribute("orderList", orderList);

	}

	@RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, UserOrder order, Model model)
			throws Exception {
		logger.info("get order view");

		User user = (User) session.getAttribute("loginuser");
		String userId = user.getUserId();

		order.setUserId(userId);
		order.setOrderId(orderId);

		List<OrderDetail> orderView = memberservice.orderDetailList(order);

		model.addAttribute("orderView", orderView);
	}

	// 주문
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(HttpSession session, UserOrder order, RedirectAttributes rttr) throws Exception {
		logger.info("주문하기 진입");
		logger.info(order.toString());

		logger.info(order.toString());

		User user = (User) session.getAttribute("loginuser");
		String userId = user.getUserId();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}
		String orderId = ymd + "_" + subNum;

		order.setOrderId(orderId);
		order.setUserId(userId);

		memberservice.orderinsert(order);

		List<OrderDetail> list = memberservice.orderDetailList(order);

		Product product = new Product();
		for (OrderDetail i : list) {
			product.setProductId(Integer.parseInt(i.getProductId()));
			product.setProductInventory(Integer.parseInt(i.getOrderQty()));
			membermapper.updateInven(product);
		}

		return "redirect:/mypage/orderList";
	}

	// 주문취소
	@RequestMapping(value = "/orderDelete")
	public String ajaxTest(HttpServletRequest request, UserOrder order) throws Exception {
		logger.info("주문 선택취소");
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		Product product = new Product();
		for (int i = 0; i < size; i++) {
			memberservice.deleteOrder(ajaxMsg[i]);
			System.out.println(ajaxMsg[i]);
		}
		return "redirect:/mypage/orderList";

//			 List<OrderDetail> list=memberservice.orderDetailList(order);
//			Product product=new Product();
//			 for(OrderDetail i: list) {
//			 product.setProductId(Integer.parseInt(i.getProductId()));
//			 product.setProductInventory(Integer.parseInt(i.getOrderQty()));
//			 	membermapper.updateInvenPuls(product);
//			 }
	}

	// 장바구니 간단조회

	@GetMapping("/orderupdate")
	public String orderIdSelect(String orderId, Model model) {
		logger.info("장바구니 간단조회 ");
		UserOrder result = memberservice.orderselect(orderId);
		System.out.println(result);
		model.addAttribute("order", result);
		return "/mypage/orderupdate";
	}

	// 장바구니수량 수정

	@PostMapping("/orderupdate")
	public String orderIdUpdatePOST(UserOrder order, RedirectAttributes rttr, Model model) {
		logger.info("수량 수정 기능 ");
		memberservice.orderupdate(order);
		rttr.addFlashAttribute("orderupdate", memberservice.orderupdate(order));

		return "redirect:/mypage/orderList";
	}

	
	// 리뷰 페이지 이동
	@GetMapping("/myreview")
	public void getreview(Model model, Criteria cri) {
		logger.info("리뷰 목록 페이지 접속");
		model.addAttribute("MyReviewlist", boardService.selectReviewList());
		int total = boardService.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
	}
	
	// 리뷰작성페이지이동
	@GetMapping("/myreviewenroll")
	public void getreviewenroll() {
		logger.info("게시글 작성 페이지 진입");
	}

	// 리뷰공지글 등록
	@PostMapping("/myreviewenroll")
	public String postReviewenroll(ReviewVO review, RedirectAttributes rttr) {
		logger.info("MyReviewVO : " + review);
		boardService.enrollReview(review);
		rttr.addFlashAttribute("Myresult", "enrol success");
		return "redirect:/mypage/myreview";
	}

	// 리뷰 조회
	@GetMapping("/myreviewget")
	public void reviewGetPageGET(int rno, Model model, Criteria cri) {
		model.addAttribute("MyreviewInfo", boardService.getReviewPage(rno));
		model.addAttribute("cri", cri);

	}

	// 리뷰 수정페이지 이동
	@GetMapping("/myreviewmodify")
	public void reviewModifyGET(int rno, Model model, Criteria cri) {
		model.addAttribute("MyreviewInfo", boardService.getReviewPage(rno));
		model.addAttribute("cri", cri);
	}

	// 리뷰 수정
	@PostMapping("/myreviewmodify")
	public String reviewModifyPOST(ReviewVO review, RedirectAttributes rttr) {
		boardService.modifyReview(review);
		rttr.addFlashAttribute("Myresult", "modify success");
		return "redirect:/mypage/myreview";
	}

	// 리뷰 삭제
	@PostMapping("/myreviewdelete")
	public String reviewDeletePOST(int rno, RedirectAttributes rttr) {
		boardService.deleteQNA(rno);
		rttr.addFlashAttribute("Myresult", "delete success");
		return "redirect:/mypage/myreview";
	}

}