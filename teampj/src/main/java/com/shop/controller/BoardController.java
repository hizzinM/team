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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.model.Criteria;
import com.shop.model.NoticeVO;
import com.shop.model.PageMakerDTO;
import com.shop.model.QnaVO;
import com.shop.model.ReviewVO;
import com.shop.model.ReplyVO;
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
	@GetMapping("/qna")
	public void getQna(Model model, Criteria cri) {
		logger.info("Qna 목록 페이지 접속");
		model.addAttribute("Qnalist", boardService.getQnaListPaging(cri));
		int total = boardService.getTotal(cri);
		int replytotal = boardService.getreplyTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		PageMakerDTO replypageMake = new PageMakerDTO(cri, replytotal);
		model.addAttribute("pageMaker", pageMake);
		model.addAttribute("replycount", replypageMake);
	}

	// qna 작성 페이지 이동
	@GetMapping("/qnaenroll")
	public void getQnaenroll() {
		logger.info("게시글 작성 페이지 진입");
	}

	// qna 등록
	@PostMapping("/qnaenroll")
	public String postQnaenroll(QnaVO qna, RedirectAttributes rttr) {
		logger.info("QnaVO : " + qna);
		boardService.enrollQNA(qna);
		rttr.addFlashAttribute("result", "enrol success");
		return "redirect:/board/qna";
	}

	// qna 조회
	@GetMapping("/getqna")
	public void QnaGetPageGET(int bno, Model model, Criteria cri) {
		model.addAttribute("qnaInfo", boardService.getQNAPage(bno));
		model.addAttribute("cri", cri);

		// 댓글 조회
		List<ReplyVO> reply = null;
		reply = boardService.replyList(bno);
		model.addAttribute("reply", reply);
	}

	// qna 수정페이지 이동
	@GetMapping("/qnamodify")
	public void QnaModifyGET(int bno, Model model, Criteria cri) {
		model.addAttribute("qnaInfo", boardService.getQNAPage(bno));
		model.addAttribute("cri", cri);
	}

	// qna 수정
	@PostMapping("/qnamodify")
	public String QnaModifyPOST(QnaVO qna, RedirectAttributes rttr) {
		boardService.modifyQNA(qna);
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/board/qna";
	}

	// qna 삭제
	@PostMapping("/qnadelete")
	public String QnaDeletePOST(int bno, RedirectAttributes rttr) {
		boardService.deleteQNA(bno);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/board/qna";
	}

	// 리뷰 페이지 이동
	@GetMapping("/review")
	public void getreview(Model model, Criteria cri) {
		logger.info("리뷰 목록 페이지 접속");
		model.addAttribute("Reviewlist", boardService.getReviewListPaging(cri));
		int total = boardService.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
	}
	// 리뷰작성페이지이동
	@GetMapping("/reviewenroll")
	public void getreviewenroll() {
		logger.info("게시글 작성 페이지 진입");
	}
	// 리뷰공지글 등록
	@PostMapping("/reviewenroll")
	public String postReviewenroll(ReviewVO review, RedirectAttributes rttr) {
		logger.info("ReviewVO : " + review);
		boardService.enrollReview(review);
		rttr.addFlashAttribute("result", "enrol success");
		return "redirect:/board/review";
	}
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, RedirectAttributes ra) {
		logger.info("reply Write");
		boardService.updateReply(vo);
		ra.addAttribute("bno", vo.getBno());

		return "redirect:/board/getqna?bno=" + vo.getBno();
	}

	// 댓글 수정 GET
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.GET)
	public void replyUpdate(@RequestParam("rno") int rno, Model model) {
		logger.info("reply update");
		ReplyVO vo = null;
		vo = boardService.selectReply(rno);
		model.addAttribute("replyUpdate", vo);
	}

	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public String replyDelete(ReplyVO vo, Model model) throws Exception {
		logger.info("reply Delete");

		model.addAttribute("replyDelete", boardService.selectReply(vo.getRno()));
		System.out.println("댓글 번호 : " + boardService.selectReply(vo.getRno()));

		return "board/replyDelete";
	}

	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, RedirectAttributes ra) throws Exception {
		logger.info("reply delete");
		boardService.deleteReply(vo);
		ra.addAttribute("bno", vo.getBno());
		return "redirect:/board/qna";
	}
	// 리뷰 조회
	@GetMapping("/reviewget")
	public void reviewGetPageGET(int rno, Model model, Criteria cri) {
		model.addAttribute("reviewInfo", boardService.getReviewPage(rno));
		model.addAttribute("cri", cri);
	}

	// 리뷰 수정페이지 이동
	@GetMapping("/reviewmodify")
	public void reviewModifyGET(int rno, Model model, Criteria cri) {
		model.addAttribute("reviewInfo", boardService.getReviewPage(rno));
		model.addAttribute("cri", cri);
	}

	// 리뷰 수정
	@PostMapping("/reviewmodify")
	public String reviewModifyPOST(ReviewVO review, RedirectAttributes rttr) {
		boardService.modifyReview(review);
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/board/review";
	}

	// 리뷰 삭제
	@PostMapping("/reviewdelete")
	public String reviewDeletePOST(int rno, RedirectAttributes rttr) {
		boardService.deleteQNA(rno);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/board/review";
	}
}