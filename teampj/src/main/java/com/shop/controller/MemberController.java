package com.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.model.User;
import com.shop.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	@Autowired
	private MemberService memberservice;

	// 회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void loginGET() {

		logger.info("회원가입 페이지 진입");

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

	/* 로그인 */
	/*
	 * User는 데이터를 전달받기 위해, HttpServletRequest는 로그인 성공 시 session에 회원 정보를 저장하기 위해,
	 * RedirectAttributes는 로그인 실패 시 리다이렉트 된 로그인 페이지에 실패를 의미하는 데이터를 전송하기 위해 사용합니다.
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, User user, RedirectAttributes rttr) throws Exception {

		// System.out.println("전달된 로그인 데이터 : " + user);

		return null;
	}
}
