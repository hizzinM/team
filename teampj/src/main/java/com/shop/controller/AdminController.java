package com.shop.controller;

import java.util.List;

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
import com.shop.model.Criteria;
import com.shop.model.PageMakerDTO;
import com.shop.model.Product;
import com.shop.service.AdminService;
import com.shop.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	MemberMapper membermapper;
	@Autowired
	MemberService memberservice;
	@Autowired
	AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	// 관리자 페이지 이동
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public void getindex() throws Exception {
		logger.info("관리자 페이지 ");
	}

	// 회원 목록 페이지 접속/데이터도 가져옴
//	@GetMapping("/membermenu")
//	public void getmemberList(Model model) {
//		logger.info("회원 목록 페이지"); 
//		model.addAttribute("membermenu", membermapper.getmemberList());
//	}

	// 회원 목록 페이지 접속/데이터도 가져옴 + 페이징(수정중)
	@GetMapping("/membermenu")
	public void getmemberList(Model model, Criteria cri) {
		logger.info("회원 목록 페이지");
		model.addAttribute("membermenu", memberservice.getmemberListPaging(cri));
//		int total = memberservice.getTotal();
//		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
//		model.addAttribute("pageMaker", pageMake);
	}

	// 주문관리 페이지 이동
	@RequestMapping(value = "ordermenu", method = RequestMethod.GET)
	public void getordermenu() throws Exception {
		logger.info("주문관리 페이지 접속");
	}

	// 상품등록 페이지 이동
	@RequestMapping(value = "goodsmenu", method = RequestMethod.GET)
	public void getgoodsmenu() throws Exception {
		logger.info("상품등록 페이지 접속");
	}

	// 상품등록 기능
	@PostMapping("/goodsmenu")
	public String goodsEnrollPOST(Product product, RedirectAttributes rttr) {

		logger.info("goodsmenuPOST......" + product);

		adminService.insertpro(product);
		rttr.addFlashAttribute("insert_result", product.getProductName());

		return "redirect:/admin/goodsmenu";
	}

	// 상품관리 페이지 이동
	@RequestMapping(value = "goodsmanage", method = RequestMethod.GET)
	public void goodsmanage() throws Exception {
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
