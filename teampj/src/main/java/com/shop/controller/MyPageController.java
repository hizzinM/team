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
	public void getadmin() throws Exception {
		logger.info("마이페이지 진입");
	}
}
