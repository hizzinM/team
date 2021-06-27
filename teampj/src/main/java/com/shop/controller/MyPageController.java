package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	// 마이페이지 이동
	@RequestMapping(value = "myindex", method = RequestMethod.GET)
	public void getmypage() throws Exception {
		logger.info("마이페이지 진입");
	}

	// 프로필 페이지 이동
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public void getprofile() throws Exception {
		logger.info("프로필 페이지 진입");
	}

	// 회원정보 수정 페이지 이동
	@RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
	public void profileupdateGET() {

		logger.info("회원정보수정 페이지 진입");

	}

}
