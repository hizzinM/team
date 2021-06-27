package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	// 관리자 페이지 이동
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public void getindex() throws Exception {
		logger.info("관리자 페이지 진입");
	}

	// 회원관리 페이지 이동
	@RequestMapping(value = "membermenu", method = RequestMethod.GET)
	public void getmembermenu() throws Exception {
		logger.info("회원관리 페이지 진입");
	}
}
