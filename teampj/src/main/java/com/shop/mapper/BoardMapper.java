package com.shop.mapper;

import java.util.List;

import com.shop.model.Criteria;
import com.shop.model.NoticeVO;

public interface BoardMapper {

	/* 공지 등록 */
	public void enroll(NoticeVO notice);

	/* 공지 목록 */
	public List<NoticeVO> getList();

	/* 공지 조회 */
	public NoticeVO getPage(int bno);

	/* 공지 수정 */
	public int modify(NoticeVO notice);

	/* 공지 삭제 */
	public int delete(int bno);

	/* 게시판 목록(페이징 적용) */
	public List<NoticeVO> getListPaging(Criteria cri);

	/* 게시판 총 갯수 */
	public int getTotal();
}
