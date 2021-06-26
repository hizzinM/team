package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/menu")
public class AdminMenuController {
	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	// 회원관리 페이지 이동
	@RequestMapping(value = "membermenu", method = RequestMethod.GET)
	public void getmembermenu() throws Exception {
		logger.info("회원관리 페이지 진입");
	}
}
