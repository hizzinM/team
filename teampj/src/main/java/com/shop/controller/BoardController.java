package com.shop.controller;

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
import com.shop.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	// 공지사항 페이지 이동
	@GetMapping("/notice")
	public void getnotice(Model model, Criteria cri) {
		logger.info("공지사항 목록 페이지 접속");
		model.addAttribute("list", boardService.getListPaging(cri));
		int total = boardService.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
	}

	// 공지글 작성 페이지 이동
	@GetMapping("/enroll")
	public void getenroll() {
		logger.info("게시글 작성 페이지 진입");
	}

	// 공지글 등록
	@PostMapping("/enroll")
	public String postenroll(NoticeVO notice, RedirectAttributes rttr) {
		logger.info("NoticeVO : " + notice);
		boardService.enroll(notice);
		rttr.addFlashAttribute("result", "enrol success");
		return "redirect:/board/notice";
	}

	// 공지글 조회
	@GetMapping("/get")
	public void boardGetPageGET(int bno, Model model, Criteria cri) {
		model.addAttribute("noticeInfo", boardService.getPage(bno));
		model.addAttribute("cri", cri);
	}

	// 공지글 수정페이지 이동
	@GetMapping("/modify")
	public void boardModifyGET(int bno, Model model, Criteria cri) {
		model.addAttribute("noticeInfo", boardService.getPage(bno));
		model.addAttribute("cri", cri);
	}

	// 공지글 수정
	@PostMapping("/modify")
	public String boardModifyPOST(NoticeVO notice, RedirectAttributes rttr) {
		boardService.modify(notice);
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/board/notice";
	}

	// 공지글 삭제
	@PostMapping("/delete")
	public String boardDeletePOST(int bno, RedirectAttributes rttr) {
		boardService.delete(bno);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/board/notice";
	}

	// qna 페이지 이동
	@RequestMapping(value = "qna", method = RequestMethod.GET)
	public void getQna(Model model) throws Exception {
		logger.info("Qna 페이지 접속");
	}
}
