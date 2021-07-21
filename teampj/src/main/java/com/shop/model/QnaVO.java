package com.shop.model;

import java.util.Date;

public class QnaVO {
	private int bno;
	private String qnaTitle;
	private String qnaCategory;
	private String userId;
	private String qnaContents;
	private Date qnaWritedate;
	private int rc;

	public QnaVO() {
		super();
	}

	public QnaVO(int bno, String qnaTitle, String qnaCategory, String userId, String qnaContents, Date qnaWritedate,
			int rc) {
		super();
		this.bno = bno;
		this.qnaTitle = qnaTitle;
		this.qnaCategory = qnaCategory;
		this.userId = userId;
		this.qnaContents = qnaContents;
		this.qnaWritedate = qnaWritedate;
		this.rc = rc;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQnaContents() {
		return qnaContents;
	}

	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}

	public Date getQnaWritedate() {
		return qnaWritedate;
	}

	public void setQnaWritedate(Date qnaWritedate) {
		this.qnaWritedate = qnaWritedate;
	}

	public int getRc() {
		return rc;
	}

	public void setRc(int rc) {
		this.rc = rc;
	}

	@Override
	public String toString() {
		return "QnaVO [bno=" + bno + ", qnaTitle=" + qnaTitle + ", qnaCategory=" + qnaCategory + ", userId=" + userId
				+ ", qnaContents=" + qnaContents + ", qnaWritedate=" + qnaWritedate + ", rc=" + rc + "]";
	}

}
