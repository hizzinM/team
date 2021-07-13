package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	// 공지사항 페이지 이동
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public void getnotice(Model model) throws Exception {
		logger.info("notice 페이지 접속");
	}

	// qna 페이지 이동
	@RequestMapping(value = "qna", method = RequestMethod.GET)
	public void getQna(Model model) throws Exception {
		logger.info("Qna 페이지 접속");
	}
}
