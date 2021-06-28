package com.shop.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.mapper.MemberMapper;
import com.shop.model.User;
import com.shop.service.MemberService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	MemberService memberservice;

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

	// 회원정보 수정페이지
	@RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
	public String profileupdateGET() throws Exception {
		return "mypage/memberUpdateView";
	}
 
}
