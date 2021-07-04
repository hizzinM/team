package com.shop.mapper;

import java.util.List;

import com.shop.model.AttachImageVO;
import com.shop.model.Criteria;
import com.shop.model.Product;

public interface AdminMapper {
	
	/* 상품 등록 */
	public void insertpro(Product product);
	/* 이미지 등록 */
	public void imageEnroll(AttachImageVO vo);
	/* 상품 목록 */
	public List<Product> selectproductList();
	/*이미지 목록*/
	public List<AttachImageVO> selectimgList();
	/*상품삭제*/
	public int deleterProdect(String productId);
	public int deleterProdectImg(String productId);
	/* 상품 수정조회페이지이동 */
	public Product goodsUpdateId(int productId);
	/* 상품 수정 페이지 */
	public Product goodsUpdateProduct(Product product);
}
