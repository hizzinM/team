package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	MemberService memberservice;

	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	// 관리자 페이지 이동
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public void getindex() throws Exception {
		logger.info("관리자 페이지 진입");
	}

	// 회원관리 페이지 이동
//	@RequestMapping(value = "membermenu", method = RequestMethod.GET)
//	public void getmembermenu() throws Exception {
//		logger.info("회원관리 페이지 진입");
//	}

	/* 회원 목록 페이지 접속 */
	@GetMapping("/membermenu")
	// => @RequestMapping(value="membermenu", method=RequestMethod.GET)
	public void getmemberList(Model model) {
		logger.info("게시판 목록 페이지 진입");
		model.addAttribute("membermenu", memberservice.getmemberList());
	}

	// 주문관리 페이지 이동
	@RequestMapping(value = "ordermenu", method = RequestMethod.GET)
	public void getordermenu() throws Exception {
		logger.info("주문관리 페이지 접속");
	}

	// 상품관리 페이지 이동
	@RequestMapping(value = "goodsmenu", method = RequestMethod.GET)
	public void getgoodsmenu() throws Exception {
		logger.info("상품관리 페이지 접속");
	}

	// 문의관리 페이지 이동
	@RequestMapping(value = "qnamenu", method = RequestMethod.GET)
	public void getqnamenu() throws Exception {
		logger.info("문의관리 페이지 접속");
	}

	// 공지관리 페이지 이동
	@RequestMapping(value = "noticemenu", method = RequestMethod.GET)
	public void getnoticemenu() throws Exception {
		logger.info("공지관리 페이지 접속");
	}
}
