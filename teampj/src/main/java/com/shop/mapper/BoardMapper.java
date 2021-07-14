package com.shop.mapper;

import com.shop.model.NoticeVO;

public interface BoardMapper {
	
	/* 게시글 등록 */
	public void enroll(NoticeVO notice);
}
