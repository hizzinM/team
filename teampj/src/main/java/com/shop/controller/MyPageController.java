package com.shop.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.mapper.MemberMapper;
import com.shop.model.AttachImageVO;
import com.shop.model.Criteria;
import com.shop.model.OrderDetail;
import com.shop.model.PageMakerDTO;
import com.shop.model.Product;
import com.shop.model.ReplyVO;
import com.shop.model.ReviewVO;
import com.shop.model.ShoppingCart;
import com.shop.model.User;
import com.shop.model.UserOrder;
import com.shop.service.AdminService;
import com.shop.service.BoardService;
import com.shop.service.MemberService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	MemberMapper membermapper;
	@Autowired
	MemberService memberservice;
	@Autowired
	AdminService adminService;
	@Autowired
	BoardService boardService;

	private static final Logger logger = LoggerFactory.getLogger("MainController.class");

	// ??????????????? ??????
	@RequestMapping(value = "myindex", method = RequestMethod.GET)
	public void getmypage() throws Exception {
		logger.info("??????????????? ??????");
	}

	// ????????? ????????? ??????
	@GetMapping("/profile")
	public void getprofile(Model model, String userId) throws Exception {
		model.addAttribute("profile", membermapper.getProfile(userId));
	}

	/* ????????? ?????? */
	@GetMapping("/profileUpdate")
	public void profileUpdateGET(String userId, Model model) {
		model.addAttribute("profile", memberservice.getProfile(userId));
	}

	// ????????? ?????? ??????
	@PostMapping("/profileUpdate")
	public String profileUpdatePOST(User user, RedirectAttributes rttr) {
		memberservice.profileUpdate(user);
		rttr.addFlashAttribute("profile", "modify success");
		return "redirect:/mypage/myindex";
	}
	// ????????? ??????????????? ???????????? ????????? ???????????? ?????? ????????? ????????? ???????????? ??????????

	// ?????? ?????? get
	@RequestMapping(value = "/profileDeleteView", method = RequestMethod.GET)
	public String profileDeleteView() throws Exception {
		return "mypage/profileDeleteView";
	}

	// ?????? ??????
	@RequestMapping(value = "/profileDelete", method = RequestMethod.POST)
	public String profileDeletePOST(User user, HttpSession session, RedirectAttributes rttr) {

		// ????????? ?????? member??? ????????? member????????? ???????????????.
		User loginuser = (User) session.getAttribute("loginuser");
		// ????????? ?????? ????????????
		String sessionPass = loginuser.getPassword();
		// vo??? ???????????? ????????????
		String voPass = user.getPassword();

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/mypage/profileDeleteView";
		}
		memberservice.profileDelete(user);
		session.invalidate();
		return "redirect:/main";
	}

	// ???????????? ??????
	@RequestMapping(value = "/addCart", method = RequestMethod.GET)
	public void GetaddCart(HttpSession session, Model model) throws Exception {
		logger.info("???????????? ??????");
		User loginuser = (User) session.getAttribute("loginuser");
		String userId = loginuser.getUserId();

		List<ShoppingCart> cartList = membermapper.selectCart(userId);

		model.addAttribute("cartList", cartList);

	}

	// ?????? ??????
	@ResponseBody
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public String addCart(ShoppingCart cart, HttpSession session) throws Exception {

		int result = 0;
		Product product = new Product();
		logger.info("?????? ?????? ??????");
		User user = (User) session.getAttribute("loginuser");

		if (user != null) {
			cart.setUserId(user.getUserId());
			cart.setCartUpdate(LocalDateTime.now());
			memberservice.addCart(cart);
			result = 1;
		}
		System.out.println(result);
		return String.valueOf(result);
	}

	// ?????? ??????
	@RequestMapping(value = "/deleteAddCart")
	public String CartDelete(HttpServletRequest request) throws Exception {
		logger.info("?????? ????????????");
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			memberservice.deleteCart(String.valueOf(ajaxMsg[i]));
			System.out.println(ajaxMsg[i]);
		}
		return "redirect:/mypage/addCart";
	}

	// ???????????? ????????????
	@GetMapping("/cartUpdate")
	public String cartQtyUpdate(String cartId, Model model) {
		logger.info("???????????? ???????????? ");
		ShoppingCart result = memberservice.selectCartId(cartId);
		System.out.println(result);

		model.addAttribute("cart", memberservice.selectCartId(cartId));

		return "/mypage/cartUpdate";
	}

	// ?????????????????? ??????
	@PostMapping("/cartUpdate")
	public String cartQtyUpdatePOST(ShoppingCart cart, RedirectAttributes rttr, Model model) {
		logger.info("?????? ?????? ?????? ");
		memberservice.updateCartQty(cart);
		rttr.addFlashAttribute("cartQty", memberservice.updateCartQty(cart));

		return "redirect:/mypage/addCart";
	}
	// ?????? ??????

	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, UserOrder order, Model model) throws Exception {
		logger.info("??????????????? ??????");
		User user = (User) session.getAttribute("loginuser");
		String userId = user.getUserId();
		// UserOrder order = new UserOrder();
		order.setUserId(userId);

		List<UserOrder> orderList = memberservice.orderList(order);

		model.addAttribute("orderList", orderList);

	}

	@RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, UserOrder order, Model model)
			throws Exception {
		logger.info("get order view");

		User user = (User) session.getAttribute("loginuser");
		String userId = user.getUserId();

		order.setUserId(userId);
		order.setOrderId(orderId);

		List<OrderDetail> orderView = memberservice.orderDetailList(order);

		model.addAttribute("orderView", orderView);
	}

	// ??????
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(HttpSession session, UserOrder order, RedirectAttributes rttr) throws Exception {
		logger.info("???????????? ??????");
		logger.info(order.toString());

		logger.info(order.toString());

		User user = (User) session.getAttribute("loginuser");
		String userId = user.getUserId();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}
		String orderId = ymd + "_" + subNum;

		order.setOrderId(orderId);
		order.setUserId(userId);

		memberservice.orderinsert(order);

		List<OrderDetail> list = memberservice.orderDetailList(order);

		Product product = new Product();
		for (OrderDetail i : list) {
			product.setProductId(Integer.parseInt(i.getProductId()));
			product.setProductInventory(Integer.parseInt(i.getOrderQty()));
			membermapper.updateInven(product);
		}

		return "redirect:/mypage/orderList";
	}

	// ????????????
	@RequestMapping(value = "/orderDelete")
	public String ajaxTest(HttpServletRequest request, UserOrder order) throws Exception {
		logger.info("?????? ????????????");
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		Product product = new Product();
		for (int i = 0; i < size; i++) {
			memberservice.deleteOrder(ajaxMsg[i]);
			System.out.println(ajaxMsg[i]);
		}
		return "redirect:/mypage/orderList";

//			 List<OrderDetail> list=memberservice.orderDetailList(order);
//			Product product=new Product();
//			 for(OrderDetail i: list) {
//			 product.setProductId(Integer.parseInt(i.getProductId()));
//			 product.setProductInventory(Integer.parseInt(i.getOrderQty()));
//			 	membermapper.updateInvenPuls(product);
//			 }
	}

	// ???????????? ????????????

	@GetMapping("/orderupdate")
	public String orderIdSelect(String orderId, Model model) {
		logger.info("???????????? ???????????? ");
		UserOrder result = memberservice.orderselect(orderId);
		System.out.println(result);
		model.addAttribute("order", result);
		return "/mypage/orderupdate";
	}

	// ?????????????????? ??????

	@PostMapping("/orderupdate")
	public String orderIdUpdatePOST(UserOrder order, RedirectAttributes rttr, Model model) {
		logger.info("?????? ?????? ?????? ");
		memberservice.orderupdate(order);
		rttr.addFlashAttribute("orderupdate", memberservice.orderupdate(order));

		return "redirect:/mypage/orderList";
	}

	
	// ?????? ????????? ??????
	@GetMapping("/myreview")
	public void getreview(HttpSession session,Model model, Criteria cri,ReviewVO review) {
		logger.info("?????? ?????? ????????? ??????");
		
		User user = (User) session.getAttribute("loginuser");
		String userId = user.getUserId();
		
		review.setUserId(userId);
		
		model.addAttribute("MyReviewlist", boardService.selectReviewList(review));
		int total = boardService.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
	}
	
	// ???????????????????????????
	@GetMapping("/myreviewenroll")
	public void getreviewenroll() {
		logger.info("????????? ?????? ????????? ??????");
	}

	// ??????????????? ??????
	@PostMapping("/myreviewenroll")
	public String postReviewenroll(ReviewVO review, RedirectAttributes rttr) {
		logger.info("MyReviewVO : " + review);
		boardService.enrollReview(review);
		rttr.addFlashAttribute("Myresult", "enrol success");
		return "redirect:/mypage/myreview";
	}

	// ?????? ??????
	@GetMapping("/myreviewget")
	public void reviewGetPageGET(int rno, Model model, Criteria cri) {
		model.addAttribute("MyreviewInfo", boardService.getReviewPage(rno));
		model.addAttribute("cri", cri);

	}

	// ?????? ??????????????? ??????
	@GetMapping("/myreviewmodify")
	public void reviewModifyGET(int rno, Model model, Criteria cri) {
		model.addAttribute("MyreviewInfo", boardService.getReviewPage(rno));
		model.addAttribute("cri", cri);
	}

	// ?????? ??????
	@PostMapping("/myreviewmodify")
	public String reviewModifyPOST(ReviewVO review, RedirectAttributes rttr) {
		boardService.modifyReview(review);
		rttr.addFlashAttribute("Myresult", "modify success");
		return "redirect:/mypage/myreview";
	}

	// ?????? ??????
	@PostMapping("/myreviewdelete")
	public String reviewDeletePOST(HttpServletRequest request) throws Exception {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
		boardService.deleteReview(ajaxMsg[i]);
		
	}
		return "redirect:/mypage/myreview";
	}
	

	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, RedirectAttributes ra) throws Exception {
		logger.info("reply delete");
		boardService.deleteReply(vo);
		ra.addAttribute("bno", vo.getBno());
		return "redirect:/board/qna";
	}
	
	/* ?????? ?????? ????????? */
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] productImg) {

		logger.info("uploadAjaxActionPOST......");
		/* ????????? ?????? ?????? */
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

		/* ?????? ?????? */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		/* ????????? ?????? ?????? ?????? */
		List<AttachImageVO> list = new ArrayList();
		// ????????? for
		for (MultipartFile multipartFile : productImg) {
			/* ????????? ?????? ?????? */
			AttachImageVO vo = new AttachImageVO();

			/* ?????? ?????? */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			vo.setImageId(0);
			/* uuid ?????? ?????? ?????? */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;

			/* ?????? ??????, ?????? ????????? ?????? File ?????? */
			File saveFile = new File(uploadPath, uploadFileName);

			/* ?????? ?????? */
			try {
				multipartFile.transferTo(saveFile);
				// ????????? ??????
				/*
				 * File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				 * 
				 * BufferedImage bo_image = ImageIO.read(saveFile); // ?????? double ratio = 3; ??????
				 * ?????? int width = (int) (bo_image.getWidth() / ratio); int height = (int)
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

				/* ?????? 2 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);

				// ??????
				double ratio = 3;
				// ?????? ??????
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

	/* ????????? ?????? ?????? */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {

		logger.info("deleteFile........" + fileName);
		File file = null;

		try {
			/* ????????? ?????? ?????? */
			file = new File("C:\\git\\team\\teampj\\src\\main\\webapp\\resources\\upload"
					+ URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			/* ?????? ?????? ?????? */
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