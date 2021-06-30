package com.shop.mapper;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shop.model.AttachImageVO;
import com.shop.model.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root_context.xml")
public class AdminMapperTests {
	@Autowired
	private AdminMapper mapper;
	
	/* 상품 등록 */
	@Test@Ignore
	public void bookEnrollTest() throws Exception{
		
		Product product = new Product();
		
		product.setProductId(0);
		product.setProductName("테스트 실험2");
		product.setProductImg("");
		product.setProductPrice("100");
		product.setProductSize("L");
		product.setProductColor("노랑");
		product.setProductInventory(1);
		
		mapper.insertpro(product);
	}
	/* 이미지 등록 */
	@Test@Ignore
	public void imageEnrollTest() {
		
		AttachImageVO vo = new AttachImageVO();
		
		vo.setProductId(1);
		vo.setFileName("test");
		vo.setUploadPath("test");
		vo.setUuid("test2");
		
		mapper.imageEnroll(vo);
		
	}
 
}
