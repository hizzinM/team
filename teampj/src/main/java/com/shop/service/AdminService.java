package com.shop.service;

import java.util.List;

import com.shop.model.AttachImageVO;
import com.shop.model.Product;
import com.shop.model.User;

public interface AdminService {
	/* 상품 등록 */
	public void insertpro(Product product);

	/* 상품 목록 */
	public List<Product> selectproductList();
	
	/*이미지 목록*/
	public List<AttachImageVO> selectimgList();
}
