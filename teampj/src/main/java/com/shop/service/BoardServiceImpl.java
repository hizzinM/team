package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.BoardMapper;
import com.shop.model.Criteria;
import com.shop.model.NoticeVO;
import com.shop.model.QnaVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardmapper;

	@Override
	public void enroll(NoticeVO notice) {
		boardmapper.enroll(notice);
	}

	@Override
	public List<NoticeVO> getList() {
		return boardmapper.getList();
	}

	@Override
	public NoticeVO getPage(int bno) {

		return boardmapper.getPage(bno);
	}

	/* 공지 수정 */
	@Override
	public int modify(NoticeVO notice) {
		return boardmapper.modify(notice);
	}

	/* 공지 삭제 */
	@Override
	public int delete(int bno) {
		return boardmapper.delete(bno);
	}

	/* 게시판 목록(페이징 적용) */
	@Override
	public List<NoticeVO> getListPaging(Criteria cri) {
		return boardmapper.getListPaging(cri);
	}

	/* 게시물 총 갯수 */
	@Override
	public int getTotal(Criteria cri) {
		return boardmapper.getTotal(cri);
	}

	@Override
	public void enrollQNA(QnaVO qna) {
		boardmapper.enrollQNA(qna);
	}

	@Override
	public List<QnaVO> getQNAList() {
		return boardmapper.getQNAList();
	}

	
	@Override
	public QnaVO getQNAPage(int qnaId) {

		return boardmapper.getQNAPage(qnaId);
	}

	@Override
	public int modifyQNA(QnaVO qna) {
		return boardmapper.modifyQNA(qna);
	}

	@Override
	public int deleteQNA(int qnaId) {
		return boardmapper.delete(qnaId);
	}

	@Override
	public List<QnaVO> getQnaListPaging(Criteria cri) {
		return boardmapper.getQnaListPaging(cri);
	}
}
