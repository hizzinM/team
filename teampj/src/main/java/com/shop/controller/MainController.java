package com.shop.controller;

import java.io.File;
import java.io.IOException;

import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.mapper.AdminMapper;
import com.shop.model.Criteria;
import com.shop.model.PageMakerDTO;
import com.shop.model.Product;
import com.shop.service.AdminService;

@Controller
public class MainController {
	@Autowired
	AdminService adminService;

	
	private static final Logger logger = LoggerFactory.getLogger("MainController.class");
	
		
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model) throws Exception {
		logger.info("메인 페이지 진입");
		List<Product> list = adminService.selectMainProductList();
		model.addAttribute("MainProduct",list);
		System.out.println(adminService.selectMainProductList());
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		logger.info("getImage()........" + fileName);
		File file = new File("C:\\git\\team\\teampj\\src\\main\\webapp\\resources\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 아우터 페이지 이동
	@RequestMapping(value = "/category/Outer", method = RequestMethod.GET)
	public void getOuter() throws Exception {
		logger.info("아우터 페이지 접속");
	}

	// 탑 페이지 이동
	@RequestMapping(value = "/category/Top", method = RequestMethod.GET)
	public void getTop() throws Exception {
		logger.info("탑 페이지 접속");
	}

	// 셔츠 페이지 이동
	@RequestMapping(value = "/category/Shirts", method = RequestMethod.GET)
	public void getShirts() throws Exception {
		logger.info("셔츠 페이지 접속");
	}

	// 팬츠 페이지 이동
	@RequestMapping(value = "/category/Pants", method = RequestMethod.GET)
	public void getPants() throws Exception {
		logger.info("팬츠 페이지 접속");
	}

	// 수트 페이지 이동
	@RequestMapping(value = "/category/Suit", method = RequestMethod.GET)
	public void getSuit() throws Exception {
		logger.info("수트 페이지 접속");
	}

	// 백/슈즈 페이지 이동
	@RequestMapping(value = "/category/BagShoes", method = RequestMethod.GET)
	public void getBagShoes() throws Exception {
		logger.info("백/슈즈 페이지 접속");
	}

	// 악세사리 페이지 이동
	@RequestMapping(value = "/category/Acc", method = RequestMethod.GET)
	public void getAcc() throws Exception {
		logger.info("악세사리 페이지 접속");
	}
	
	
	
	
	
	
}
