package com.shop.service;

import java.util.List;

import com.shop.model.Criteria;
import com.shop.model.NoticeVO;
import com.shop.model.QnaVO;
import com.shop.model.ReviewVO;
import com.shop.model.ReplyVO;

public interface BoardService {

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
	public int getTotal(Criteria cri);

	/* QNA 등록 */
	public void enrollQNA(QnaVO qna);

	/* QNA 목록 */
	public List<QnaVO> getQNAList();

	/* QNA 조회 */
	public QnaVO getQNAPage(int bno);

	/* QNA 수정 */
	public int modifyQNA(QnaVO qna);

	/* QNA 삭제 */
	public int deleteQNA(int bno);

	/* QnaVO 목록(페이징 적용) */
	public List<QnaVO> getQnaListPaging(Criteria cri);
	
	/* 리뷰 등록 */
	public void enrollReview(ReviewVO review);

	/* 리뷰 목록 */
	public List<ReviewVO> getReviewList();

	/* 리뷰 조회 */
	public ReviewVO getPageReview(int reviewId);

	/* 리뷰 수정 */
	public int modifyReview(ReviewVO review);

	/* 리뷰 삭제 */
	public int deleteReview(int reviewId);

	/* 리뷰 목록(페이징 적용) */
	public List<ReviewVO> getReviewListPaging(Criteria cri);

	// 댓글 조회
	public List<ReplyVO> replyList(int bno);

	// 댓글 조회
	public void writereply(ReplyVO reply);

	// 댓글 수정
	public void modifyreply(ReplyVO reply);

	// 댓글 삭제
	public void deletereply(ReplyVO reply);
	
	// 댓글 갯수
		public int getreplyTotal(Criteria cri);


}
