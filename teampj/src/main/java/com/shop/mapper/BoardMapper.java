package com.shop.mapper;

import java.util.List;

import com.shop.model.NoticeVO;

public interface BoardMapper {

	/* 공지 등록 */
	public void enroll(NoticeVO notice);

	/* 공지 목록 */
	public List<NoticeVO> getList();

	/* 공지 조회 */
	public NoticeVO getPage(int bno);
}
