package com.shop.mapper;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shop.model.AttachImageVO;
import com.shop.model.Criteria;
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
		product.setProductName("테스트 실험3");
		product.setProductPrice("100");
		product.setProductSize("L");
		product.setProductColor("노랑");
		product.setProductInventory(1);
		System.out.println("Before AttachImageVO :" + product);
		
		
		mapper.insertpro(product);
		System.out.println("After AttachImageVO :" + product);
	}
	/* 이미지 등록 */
	@Test@Ignore
	public void imageEnrollTest() {
		
		AttachImageVO vo = new AttachImageVO();
		
		vo.setProductId(2);
		vo.setFileName("test");
		vo.setUploadPath("test");
		vo.setUuid("test02");
		
		mapper.imageEnroll(vo);
		
	}
	@Test@Ignore
	public void selectproductList() {
		Criteria cri=new Criteria();
		cri.setKeyword("테스트");
		
		List list=mapper.selectproductList();
		for(int i = 0; i < list.size(); i++) {
			System.out.println("result......." + i + " : " + list.get(i));
		}
		
	}


}
