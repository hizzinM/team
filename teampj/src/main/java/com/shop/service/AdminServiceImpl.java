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
import com.shop.model.User;

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
		if (product.getImageList() == null || product.getImageList().size() <= 0) {
			return;
		}
		product.getImageList().forEach(attach -> {
			attach.setProductId(product.getProductId());
			adminMapper.imageEnroll(attach);
		});
	}

	/* 상품리스트(페이징) */
	@Override
	public List<Product> selectproductList(Criteria cri) {
		logger.info("selectproductList()......");
		return adminMapper.selectproductList(cri);
	}
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri) {
		logger.info("goodsGetTotal().........");
		return adminMapper.goodsGetTotal(cri);
	}
	
	/* 상품이미지 리스트 */
	@Override
	public List<AttachImageVO> selectimgList() {
		return adminMapper.selectimgList();
	}
	
	/* 상품 수정 조회 페이지 */
	@Override
	public Product goodsUpdateId(int productId) {
		logger.info("(service)goodsGetDetail......." + productId);
		return adminMapper.goodsUpdateId(productId);
	}
	
	/* 상품삭제 */
	@Override
	public int deleterProdect(String productId) {
		adminMapper.deleterProdectImg(productId);
		return adminMapper.deleterProdect(productId);
	}

	/* 회원삭제 */
	@Override
	public int userDelete(String userId) {
		return adminMapper.userDelete(userId);
	}

	/* 상품 수정 페이지 */
	@Override
	public int goodsUpdateProduct(Product product) {
		//logger.info("(service)goodsUpdateProduct........");
		System.out.println("(service)goodsUpdateProduct........");
		adminMapper.goodsUpdateProduct(product);
			System.out.println("2222");
		if (product.getImageList() == null || product.getImageList().size() <= 0) {
			//System.out.println("1111");
			
			//System.out.println( product.getImageList().size());
			return 0;
	}
		System.out.println(product);
		System.out.println(product.getImageList());
		
		product.getImageList().forEach(attach -> {
			attach.setProductId(product.getProductId());
			System.out.println(product.getImageList());
			adminMapper.deleterProdectImg(( String.valueOf(product.getProductId())));
			adminMapper.imageEnroll(attach);
		});
	
		return 1;

	}

	/*회원정보수정조회*/

	@Override
	public int goodsUpdateProductImg(AttachImageVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	public User profileUpdateAdminId(String userId) {
		
		return adminMapper.profileUpdateAdminId(userId);
	}
	/*회원정보수정*/
	@Override
	public int profileUpdateAdmin(User user) {
		
		return adminMapper.profileUpdateAdmin(user);
	}


	

}