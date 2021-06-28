package com.shop.controller;

import java.io.Console;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.type.filter.AbstractClassTestingTypeFilter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String findid(String email) throws Exception {

		return "/member/findid";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(User user) throws Exception {

		logger.info("join 진입");

		// 회원가입 서비스 실행
		memberservice.memberJoin(user);

		logger.info("join Service 성공");

		return "redirect:/main";

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

	/* 로그인 */
	/*
	 * User는 데이터를 전달받기 위해, HttpServletRequest는 로그인 성공 시 session에 회원 정보를 저장하기 위해,
	 * RedirectAttributes는 로그인 실패 시 리다이렉트 된 로그인 페이지에 실패를 의미하는 데이터를 전송하기 위해 사용합니다.
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, User user, RedirectAttributes rttr) throws Exception {

		// System.out.println("전달된 로그인 데이터 : " + user);
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
		logger.info("logoutMainGET메서드 진입");

		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:/main";
	}

}