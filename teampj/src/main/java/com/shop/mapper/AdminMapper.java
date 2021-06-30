package com.shop.mapper;

import java.util.List;

import com.shop.model.AttachImageVO;
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
}
