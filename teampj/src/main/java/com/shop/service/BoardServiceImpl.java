package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.BoardMapper;
import com.shop.model.NoticeVO;

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
}
