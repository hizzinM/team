package com.shop.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.mapper.AdminMapper;
import com.shop.model.AttachImageVO;
import com.shop.model.Criteria;
import com.shop.model.Product;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger logger = LoggerFactory.getLogger("AdminServiceImpl.class");
	@Autowired
	private AdminMapper adminMapper;	
	
	/* 상품 등록 */
	
	@Override
	public void insertpro(Product product) {
		
		logger.info("(service)insertpro........");
		
		adminMapper.insertpro(product);
		
		if(product.getImageList() == null || product.getImageList().size() <= 0) {
			return;
		}
		
		product.getImageList().forEach(attach ->{
			
			attach.setProductId(product.getProductId());
			adminMapper.imageEnroll(attach);
		});
	}
	/*상품리스트*/
	@Override
	public List<Product> selectproductList() {
		logger.info("selectproductList()......");
		return adminMapper.selectproductList();
	}
	
	@Override
	public List<AttachImageVO> selectimgList(){
		return adminMapper.selectimgList();
	}
	
	/* 상품 조회 페이지 */
	@Override
	public Product goodsUpdate(int productId) {
		
		logger.info("(service)goodsGetDetail......." + productId);
		return adminMapper.goodsUpdate(productId);
	}	
	
	/*상품삭제*/
	@Override 
	public int deleterProdect(String productId) {
		
		adminMapper.deleterProdectImg(productId);
		
		return adminMapper.deleterProdect(productId);
	}
}
