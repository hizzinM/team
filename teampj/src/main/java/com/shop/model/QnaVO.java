package com.shop.model;

import java.util.Date;

public class QnaVO {
	private int qnaId;
	private String qnaTitle;
	private String qnaCategory;
	private String userTd;
	private String qnaContents;
	private int qnaState;
	private Date qnaWritedate;

	public QnaVO() {
		super();
	}

	public QnaVO(int qnaId, String qnaTitle, String qnaCategory, String userTd, String qnaContents, int qnaState,
			Date qnaWritedate) {
		super();
		this.qnaId = qnaId;
		this.qnaTitle = qnaTitle;
		this.qnaCategory = qnaCategory;
		this.userTd = userTd;
		this.qnaContents = qnaContents;
		this.qnaState = qnaState;
		this.qnaWritedate = qnaWritedate;
	}

	public int getQnaId() {
		return qnaId;
	}

	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
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

	public String getUserTd() {
		return userTd;
	}

	public void setUserTd(String userTd) {
		this.userTd = userTd;
	}

	public String getQnaContents() {
		return qnaContents;
	}

	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}

	public int getQnaState() {
		return qnaState;
	}

	public void setQnaState(int qnaState) {
		this.qnaState = qnaState;
	}

	public Date getQnaWritedate() {
		return qnaWritedate;
	}

	public void setQnaWritedate(Date qnaWritedate) {
		this.qnaWritedate = qnaWritedate;
	}

	@Override
	public String toString() {
		return "QnaVO [qnaId=" + qnaId + ", qnaTitle=" + qnaTitle + ", qnaCategory=" + qnaCategory + ", userTd="
				+ userTd + ", qnaContents=" + qnaContents + ", qnaState=" + qnaState + ", qnaWritedate=" + qnaWritedate
				+ "]";
	}

}
