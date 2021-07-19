package com.shop.model;

import java.util.Date;

public class ReplyVO {
	private int bno;
	private int rno;
	private String replyContent;
	private String userId;
	private Date replyWritedate;

	public ReplyVO() {
		super();
	}

	public ReplyVO(int bno, int rno, String replyContent, String userId, Date replyWritedate) {
		super();
		this.bno = bno;
		this.rno = rno;
		this.replyContent = replyContent;
		this.userId = userId;
		this.replyWritedate = replyWritedate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getReplyWritedate() {
		return replyWritedate;
	}

	public void setReplyWritedate(Date replyWritedate) {
		this.replyWritedate = replyWritedate;
	}

	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", rno=" + rno + ", replyContent=" + replyContent + ", userId=" + userId
				+ ", replyWritedate=" + replyWritedate + "]";
	}

}
