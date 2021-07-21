package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.BoardMapper;
import com.shop.model.Criteria;
import com.shop.model.NoticeVO;
import com.shop.model.QnaVO;

import com.shop.model.ReviewVO;
import com.shop.model.ReplyVO;

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

	// QNA
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
	public int deleteQNA(int bno) {
		return boardmapper.delete(bno);
	}

	@Override
	public List<QnaVO> getQnaListPaging(Criteria cri) {
		return boardmapper.getQnaListPaging(cri);
	}
	/* 리뷰 */

	@Override
	public void enrollReview(ReviewVO review) {
		boardmapper.enrollReview(review);
	}

	@Override
	public List<ReviewVO> getReviewList() {
		return boardmapper.getReviewList();
	}

	@Override
	public ReviewVO getReviewPage(int reviewId) {
		return boardmapper.getReviewPage(reviewId);
	}

	@Override
	public int modifyReview(ReviewVO review) {
		return boardmapper.modifyReview(review);
	}

	@Override
	public int deleteReview(int reviewId) {
		return boardmapper.deleteReview(reviewId);
	}

	@Override
	public List<ReviewVO> getReviewListPaging(Criteria cri) {
		return boardmapper.getReviewListPaging(cri);
	}
	@Override
	public int getReviewTotal(Criteria cri) {
		return boardmapper.getReviewTotal(cri);
	}
	
	// 댓글
	@Override
	public List<ReplyVO> replyList(int bno) {
		return boardmapper.replyList(bno);
	}

	@Override
	public void writereply(ReplyVO reply) {
		boardmapper.writereply(reply);
	}

	@Override
	public void modifyreply(ReplyVO reply) {
		boardmapper.modifyreply(reply);
	}

	@Override
	public void deletereply(ReplyVO reply) {
		boardmapper.deletereply(reply);
	}

	/* 게시물 총 갯수 */
	@Override
	public int getreplyTotal(Criteria cri) {
		return boardmapper.getreplyTotal(cri);
	}


}
