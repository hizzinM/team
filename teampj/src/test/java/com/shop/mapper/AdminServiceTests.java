package com.shop.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shop.model.AttachImageVO;
import com.shop.model.Product;
import com.shop.service.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root_context.xml")
public class AdminServiceTests {

	@Autowired
	private AdminService adminService;
	
	/* 상품 등록 & 상품 이미지 등록 테스트 */
	@Test
	public void bookEnrollTEsts() {
		Product product = new Product();
		// 상품 정보
		product.setProductId(0);
		product.setProductName("테스트DB2");		
		product.setProductPrice(154);
		product.setProductSize("L");
		product.setProductColor("노랑");
		product.setProductInventory(2);
		

		// 이미지 정보
		List<AttachImageVO> imagelist = new ArrayList<AttachImageVO>(); 
		
		AttachImageVO image1 = new AttachImageVO();
		AttachImageVO image2 = new AttachImageVO();
		
		image1.setFileName("test Image 1");
		image1.setUploadPath("test image 1");
		image1.setUuid("test1111");
		
		image2.setFileName("test Image 2");
		image2.setUploadPath("test image 2");
		image2.setUuid("test2222");
		
		imagelist.add(image1);
		imagelist.add(image2);
		
		
		product.setImageList(imagelist);
		// bookEnroll() 메서드 호출
		adminService.insertpro(product);
		
		System.out.println("등록된 VO : " + product);
		
		
	}
}
