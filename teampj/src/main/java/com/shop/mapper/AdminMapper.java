package com.shop.mapper;

import com.shop.model.AttachImageVO;
import com.shop.model.Product;

public interface AdminMapper {
	
	/* 상품 등록 */
	public void insertpro(Product product);
	/* 이미지 등록 */
	public void imageEnroll(AttachImageVO vo);

}
