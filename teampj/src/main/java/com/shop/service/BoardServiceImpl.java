package com.shop.service;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static final Logger logger = LoggerFactory.getLogger("BoardServiceImpl.class");
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
		boardmapper.deleteboardreply(bno);
		return boardmapper.deleteQNA(bno);
	}

	@Override
	public List<QnaVO> getQnaListPaging(Criteria cri) {
		return boardmapper.getQnaListPaging(cri);
	}
	/* 리뷰 */

	@Override
	public void enrollReview(ReviewVO review) {
		logger.info("(BoardServiceImpl)enrollReview");
		Date now=new Date();
		review.setReviewWritedate(now);
		boardmapper.enrollReview(review);
		if (review.getImageList() == null || review.getImageList().size() <= 0) {
			return;
		}
		review.getImageList().forEach(reviewimg ->{
			reviewimg.setReviewId(review.getReviewId());
			boardmapper.imageReview(reviewimg);
		});
	}

	@Override
	public List<ReviewVO> getReviewList() {
		return boardmapper.getReviewList();
	}

	@Override
	public List<ReviewVO> selectReviewList() {

		return boardmapper.selectReviewList();
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
	public ReplyVO selectReply(int rno) {
		return boardmapper.selectReply(rno);
	}

	@Override
	public void writereply(ReplyVO reply) {
		boardmapper.writereply(reply);
	}

	@Override
	public void updateReply(ReplyVO reply) {
		boardmapper.updateReply(reply);
	}

	@Override
	public void deleteReply(ReplyVO reply) {
		boardmapper.deleteReply(reply);
	}

	// 답변완료체크
	@Override
	public int getreplyTotal(int bno) {
		return boardmapper.getreplyTotal(bno);
	}

	@Override
	public void deleteboardreply(int bno) {
	}

}
