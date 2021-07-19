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

import com.shop.model.Criteria;
import com.shop.model.NoticeVO;
import com.shop.model.PageMakerDTO;
import com.shop.model.QnaVO;
import com.shop.model.ReplyVO;
import com.shop.service.BoardService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	private BoardService boardService;

	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writereply(ReplyVO reply) throws Exception {
		boardService.writereply(reply);
		return "redirect:/board/getqna?bno=" + reply.getBno();
	}
}
