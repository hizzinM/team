package com.shop.controller;

import java.awt.Graphics2D;
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
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.mapper.MemberMapper;
import com.shop.model.AttachImageVO;
import com.shop.model.Criteria;
import com.shop.model.PageMakerDTO;
import com.shop.model.Product;
import com.shop.model.User;
import com.shop.service.AdminService;
import com.shop.service.MemberService;

import net.coobird.thumbnailator.Thumbnails;

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

	/* 게시판 목록 페이지 접속(페이징 적용) */
	@GetMapping("/membermenu")
	public void getmemberList(Model model, Criteria cri) {
		logger.info("회원 목록 페이지");
		model.addAttribute("membermenu", memberservice.getListPaging(cri));
		int total = memberservice.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
	}
	//회원정보조회
	@GetMapping("/AdminMemberUpdate")
	public String profileUpdate(String userId,Model model) {
		
		User result=adminService.profileUpdateAdminId(userId);
		System.out.println(result);
		
		model.addAttribute("profile",adminService.profileUpdateAdminId(userId));
		
		return "/admin/AdminMemberUpdate";
	}
	// 프로필 수정 기능
		@PostMapping("/AdminMemberUpdate")
		public String profileUpdatePOST(User user, RedirectAttributes rttr) {
			adminService.profileUpdateAdmin(user);
			rttr.addFlashAttribute("profile", "modify success");
			return "/admin/AdminMemberUpdateResult";
		}
	
	

	// 회원 선택삭제
	@RequestMapping(value = "/userDelete")
	public String ajaxTest2(HttpServletRequest request) throws Exception {

		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			adminService.userDelete(ajaxMsg[i]);
			System.out.println(ajaxMsg[i]);
		}
		return "redirect:/admin/membermenu";
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

	// 상품 등록
	@PostMapping("/goodsmenu")
	public String goodsEnrollPOST(Product product, RedirectAttributes rttr) {

		logger.info("goodsmenuPOST......" + product);

		adminService.insertpro(product);

		rttr.addFlashAttribute("insert_result", product.getProductName());

		return "redirect:/admin/goodsmenu";
	}

	// 상품관리 페이지 이동
	@RequestMapping(value = "goodsmanage", method = RequestMethod.GET)
	public void goodsmanage(Criteria cri,Model model) throws Exception {
		logger.info("상품관리 페이지 접속");
		/* 상품 리스트 데이터 */
		List list = adminService.selectproductList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("produstList", list);
		} else {
		model.addAttribute("listCheck", "empty");
			return;
		}
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageMakerDTO(cri, adminService.goodsGetTotal(cri)));;

	}

	// 상품 선택삭제
	@RequestMapping(value = "/delete")
	public String ajaxTest(HttpServletRequest request) throws Exception {

		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			adminService.deleterProdect(ajaxMsg[i]);
			System.out.println(ajaxMsg[i]);
		}
		return "redirect:/admin/goodsmanage";
	}

	/* 상품 수정 페이지이동 */
	@GetMapping("/Update")
	public String goodsGetInfoGET(int productId, Criteria cri, Model model) {

		logger.info("goodsGetInfo()........." + productId);

		Product result = adminService.goodsUpdateId(productId);
		System.out.println(result);
		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);

		/* 조회 페이지 정보 */
		model.addAttribute("goodsUpdateData", adminService.goodsUpdateId(productId));

		return "/admin/goodsUpdate";
	}
	/* 상품 수정 */
	@PostMapping("/Update")
	public String goodsProductUpdate(RedirectAttributes rttr,Product product,AttachImageVO vo,MultipartFile file) {
	adminService.goodsUpdateProduct(product);
	//System.out.println(adminService.goodsUpdateProduct(product));
	rttr.addFlashAttribute("resultProduct","resultProduct success");
	return "/admin/goodsUpdateResult";
	}
	


//	public String goodsProductUpdate(RedirectAttributes rttr, Product product, MultipartFile file,
//			AttachImageVO attachImageVO) {
//		adminService.goodsUpdateProduct(product);
//		System.out.println(adminService.goodsUpdateProduct(product));
//		rttr.addFlashAttribute("resultProduct", "resultProduct success");
//		return "/admin/result";
//	}

	
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

	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		logger.info("uploadAjaxActionPOST......");
		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {

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
		for (MultipartFile multipartFile : uploadFile) {
			/* 이미지 정보 객체 */
			AttachImageVO vo = new AttachImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);

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
