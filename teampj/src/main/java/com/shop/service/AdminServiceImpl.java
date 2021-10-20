package com.shop.service;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.mapper.AdminMapper;
import com.shop.model.AttachImageVO;
import com.shop.model.Criteria;
import com.shop.model.OrderDetail;
import com.shop.model.Product;
import com.shop.model.User;
import com.shop.model.UserOrder;

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
			if(attach.getImageId()!=0) {
			attach.setProductId(product.getProductId());
			adminMapper.imageEnroll(attach);
			}
		});
		
	}

	/* 상품리스트(페이징) */
	@Override
	public List<Product> selectproductList(Criteria cri) {
		logger.info("selectproductList()......");
		return adminMapper.selectproductList(cri);
	}

	/* 상품검색(페이징) */
	@Override
	public List<Product> searchproductList(Criteria cri) {
		logger.info("searchproductList()......");
		return adminMapper.searchproductList(cri);
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

	/* 상품 상세페이지 */
	@Override
	public Product ProductDetailNameList(String productName) {
		logger.info("(service)goodsGetDetail......." + productName);
		return adminMapper.ProductDetailNameList(productName);
	}

	/* 상품삭제 */
	@Override
	public int deleterProdect(String productId) {
		adminMapper.deleterProdectImgAll(productId);
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

		System.out.println("(service)goodsUpdateProduct........");
		adminMapper.goodsUpdateProduct(product);

		if (product.getImageList() == null || product.getImageList().size() <= 0) {
			return 0;
		}
		// System.out.println(product);
		// System.out.println(product.getImageList());

		product.getImageList().forEach(attach -> {
			if(attach.getImageId()!=0) {
			attach.setProductId(product.getProductId());
			System.out.println(product.getImageList());
			adminMapper.deleterProdectImg(attach);
			adminMapper.imageEnroll(attach);
			}
		});
		return 0;

		// adminMapper.goodsUpdateProduct(product);

		// logger.info("(service)goodsUpdateProduct........");
		// adminMapper.deleterProdectImg(productId);
		// adminMapper.deleterProdect(productId);
		// adminMapper.insertpro(product);
		// if (product.getImageList() == null || product.getImageList().size() <= 0) {
		// return;
		// }
		// product.getImageList().forEach(attach -> {
		// attach.setProductId(product.getProductId());
		// adminMapper.imageEnroll(attach);
		/// });
	}

	@Override
	public int goodsUpdateProductImg(AttachImageVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	/* 회원정보수정조회 */
	@Override
	public User profileUpdateAdminId(String userId) {
		return adminMapper.profileUpdateAdminId(userId);
	}

	/* 회원정보수정 */
	@Override
	public int profileUpdateAdmin(User user) {
		return adminMapper.profileUpdateAdmin(user);
	}

	/* 메인페이지 상품목록 */
	@Override
	public List<Product> selectMainProductList() {

		return adminMapper.selectMainProductList();
	}

	// Outer목록
	@Override
	public List<Product> OuterProductList() {

		return adminMapper.OuterProductList();
	}

	// Top목록
	@Override
	public List<Product> TopProductList() {

		return adminMapper.TopProductList();
	}

	// Shirts목록
	@Override
	public List<Product> ShirtsProductList() {

		return adminMapper.ShirtsProductList();
	}

	// Pants목록
	@Override
	public List<Product> PantsProductList() {

		return adminMapper.PantsProductList();
	}

	// Suit목록
	@Override
	public List<Product> SuitProductList() {

		return adminMapper.SuitProductList();
	}

	// BagShoes목록
	@Override
	public List<Product> BagShoesProductList() {

		return adminMapper.BagShoesProductList();
	}

	// Acc목록
	@Override
	public List<Product> AccProductList() {

		return adminMapper.AccProductList();
	}
	/*관리자 주문관리페이지*/
	@Override
	public List<UserOrder> orderAdminList(Criteria cri) {
		return adminMapper.orderAdminList(cri);
	}

	@Override
	public List<OrderDetail> selectorderadmin(UserOrder order) throws Exception {

		return adminMapper.selectorderadmin(order);
	}
	/*관리자메인페이지(주문)*/
	@Override
	public List<UserOrder> selectAdminindex() {
		return adminMapper.selectAdminindex();
	}
	/*관리자메인페이지(회원)*/
	@Override
	public List<User> selectAdminUser() {
		
		return adminMapper.selectAdminUser();
	}

}