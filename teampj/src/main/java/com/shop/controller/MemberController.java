package com.shop.controller;
 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.shop.mapper.MemberMapper; 
import com.shop.model.User;
import com.shop.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private MemberService memberservice;

	// 회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void loginGET() {
		logger.info("회원가입 페이지 진입");
	}

	// 아이디 찾기 폼
	@RequestMapping(value = "/findid")
	public String FindId() throws Exception {
		return "/member/findid";
	}

	@RequestMapping(value = "/findidAfter", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md)
			throws Exception {
		md.addAttribute("findid", memberservice.findid(response, email));
		return "/member/findidAfter";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(User user) throws Exception {
		logger.info("join 진입");
		// 회원가입 서비스 실행
		memberservice.memberJoin(user);
		logger.info("join Service 성공");
		return "redirect:/main";

	}

	// 비밀번호 찾기 폼
	@RequestMapping(value = "/findpwd")
	public String Findpwd() throws Exception {

		return "/member/findpwd";
	}

	@RequestMapping(value = "/findpwdResult", method = RequestMethod.POST)
	public String selectPasswordPost(HttpServletResponse response, @RequestParam("userId") String userId, Model md)
			throws Exception {
		md.addAttribute("findpwd", memberservice.selectPassword(response, userId));
		return "/member/findpwdResult";
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void joinGET() {
		logger.info("로그인 페이지 진입");
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {
		logger.info("memberIdChk() 진입");
		int result = memberservice.idCheck(memberId);
		logger.info("결과값 = " + result);
		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}

	@RequestMapping(value = "/kakaologin.do", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		// 결과값을 node에 담아줌
		JsonNode node = KakaoController.getAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보

		System.out.println(accessToken);

		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
		String kemail = null;
		String kname = null;
		String kgender = null;
		String kbirthday = null;
		String kage = null;
		String kimage = null;
		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		System.out.println(kakao_account);
		System.out.println(properties);
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		kimage = properties.path("profile_image").asText();
		kgender = kakao_account.path("gender").asText();
		int gender = 0;
		if (kgender.equals("male")) {
			gender = 1;
		} else {
			gender = 0;
		}
		return "redirect:/";
	}
	// end kakaoLogin()

	/* 로그인 */
	/*
	 * User는 데이터를 전달받기 위해, HttpServletRequest는 로그인 성공 시 session에 회원 정보를 저장하기 위해,
	 * RedirectAttributes는 로그인 실패 시 리다이렉트 된 로그인 페이지에 실패를 의미하는 데이터를 전송하기 위해 사용합니다.
	 */

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, User user, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		User loginuser = memberservice.memberLogin(user);
		if (loginuser == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		}

		session.setAttribute("loginuser", loginuser); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		return "redirect:/main";
	}

	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main";
	}

	// 주문 페이지 이동
	@RequestMapping(value = "order", method = RequestMethod.GET)
	public void orderGET() {
		logger.info("주문 페이지 진입");
	}

}