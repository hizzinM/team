package com.shop.model;

import java.util.Date;

public class NoticeVO {
	/* 공지게시판 번호 */
	private int bno;

	/* 공지게시판 제목 */
	private String noticeTitle;

	/* 공지게시판 내용 */
	private String noticeContent;

	/* 공지 작성자 */
	private String userId;

	/* 중요공지 구분 */
	private int noticeBold;

	/* 공지 작성일 */
	private Date noticeWritedate;
 
	public NoticeVO() {
		super();
	}

	public NoticeVO(int bno, String noticeTitle, String noticeContent, String userId, int noticeBold,
			Date noticeWritedate) {
		super();
		this.bno = bno;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.userId = userId;
		this.noticeBold = noticeBold;
		this.noticeWritedate = noticeWritedate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getNoticeBold() {
		return noticeBold;
	}

	public void setNoticeBold(int noticeBold) {
		this.noticeBold = noticeBold;
	}

	public Date getNoticeWritedate() {
		return noticeWritedate;
	}

	public void setNoticeWritedate(Date noticeWritedate) {
		this.noticeWritedate = noticeWritedate;
	}

	@Override
	public String toString() {
		return "NoticeVO [bno=" + bno + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", userId=" + userId + ", noticeBold=" + noticeBold + ", noticeWritedate=" + noticeWritedate + "]";
	}

}
