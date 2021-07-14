package com.shop.controller;

import java.time.LocalDateTime;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.mapper.MemberMapper;
import com.shop.model.Product;
import com.shop.model.ShoppingCart;
import com.shop.model.User;
import com.shop.service.AdminService;
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
		public void GetaddCart(HttpSession session,Model model) throws Exception {
			logger.info("장바구니 진입");
			User loginuser = (User)session.getAttribute("loginuser");
			String userId=loginuser.getUserId();
			
			List<ShoppingCart> cartList=membermapper.selectCart(userId);
			
			model.addAttribute("cartList", cartList);
			
		}
	
	// 카트 담기
		@ResponseBody
		@RequestMapping(value = "/addCart", method =RequestMethod.POST)
		   public int addCart(ShoppingCart cart, HttpSession session) throws Exception {
			 int result=0;
			
			logger.info("카트 담기 진입");
			User user = (User)session.getAttribute("loginuser");
			
			if(user != null) {
		    cart.setUserId(user.getUserId());
		    cart.setCartUpdate(LocalDateTime.now());
		    memberservice.addCart(cart);
		    result = 1;
			 }
			return	result;		 
		}
		// 카트 삭제
		@RequestMapping(value = "/deleteAddCart")
		public String CartDelete(HttpServletRequest request) throws Exception {
			logger.info("상품 선택삭제");
			String[] ajaxMsg = request.getParameterValues("valueArr");
			int size = ajaxMsg.length;
			for (int i = 0; i < size; i++) {
				memberservice.deleteCart(ajaxMsg[i]);
				System.out.println(ajaxMsg[i]);
			}
			return "redirect:/mypage/addCart";
		}

		
		
		
		
		
		
}