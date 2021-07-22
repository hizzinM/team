package com.shop.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.model.AttachImageVO;
import com.shop.model.Criteria;
import com.shop.model.NoticeVO;
import com.shop.model.PageMakerDTO;
import com.shop.model.QnaVO;
import com.shop.model.ReviewVO;
import com.shop.model.ReplyVO;
import com.shop.service.BoardService;

import net.coobird.thumbnailator.Thumbnails;

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
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
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
		logger.info(" get qna 페이지 접속");
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
		logger.info("qna 수정 페이지 접속");
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
		logger.info(" qna 삭제");
		boardService.deleteQNA(bno);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/board/qna";
	}

	// 리뷰 페이지 이동
	@GetMapping("/review")
	public void getreview(Model model, Criteria cri) {
		logger.info("리뷰 목록 페이지 접속");
		model.addAttribute("Reviewlist", boardService.getReviewListPaging(cri));
		int total = boardService.getReviewTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
	}

	// 리뷰 작성 페이지 이동
	@GetMapping("/reviewenroll")
	public void getreviewenroll() {
		logger.info("게시글 작성 페이지 진입");
	}

	// 리뷰 등록
	@PostMapping("/reviewenroll")
	public String postReviewenroll(ReviewVO review, RedirectAttributes rttr) {
		logger.info("ReviewVO : " + review);
		boardService.enrollReview(review);
		rttr.addFlashAttribute("result", "enrol success");
		return "redirect:/board/review";
	}

	// 리뷰 조회
	@GetMapping("/reviewget")
	public void reviewGetPageGET(int reviewId, Model model, Criteria cri) {
		model.addAttribute("reviewInfo", boardService.getReviewPage(reviewId));
		model.addAttribute("cri", cri);
	}

	// 리뷰 수정페이지 이동
	@GetMapping("/reviewmodify")
	public void reviewModifyGET(int reviewId, Model model, Criteria cri) {
		model.addAttribute("reviewInfo", boardService.getReviewPage(reviewId));
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
	public String reviewDeletePOST(int reviewId, RedirectAttributes rttr) {
		boardService.deleteReview(reviewId);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/board/review";
	}

	// 이 아래부터 덧글
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

	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] productImg) {

		logger.info("uploadAjaxActionPOST......");
		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : productImg) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {

				e.printStackTrace();
			}
			if (!type.startsWith("image")) {
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}

		}
		String uploadFolder = "C:\\git\\team\\teampj\\src\\main\\webapp\\resources\\upload";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();
		// 향상된 for
		for (MultipartFile multipartFile : productImg) {
			/* 이미지 정보 객체 */
			AttachImageVO vo = new AttachImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			vo.setImageId(0);
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				// 썸네일 생성
				/*
				 * File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				 * 
				 * BufferedImage bo_image = ImageIO.read(saveFile); // 비율 double ratio = 3; 넓이
				 * 높이 int width = (int) (bo_image.getWidth() / ratio); int height = (int)
				 * (bo_image.getHeight() / ratio);
				 * 
				 * BufferedImage bt_image = new BufferedImage(width, height,
				 * BufferedImage.TYPE_3BYTE_BGR);
				 * 
				 * Graphics2D graphic = bt_image.createGraphics();
				 * 
				 * graphic.drawImage(bo_image, 0, 0,width,height, null);
				 * 
				 * ImageIO.write(bt_image, "jpg", thumbnailFile);
				 */

				/* 방법 2 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);

				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);

			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(vo);
		} // for
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		return result;
	}

	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {

		logger.info("deleteFile........" + fileName);
		File file = null;

		try {
			/* 썸네일 파일 삭제 */
			file = new File("C:\\git\\team\\teampj\\src\\main\\webapp\\resources\\upload"
					+ URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");

			logger.info("originFileName : " + originFileName);

			file = new File(originFileName);

			file.delete();

		} catch (Exception e) {

			e.printStackTrace();

			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

		}
		return new ResponseEntity<String>("success", HttpStatus.OK);

	}
}