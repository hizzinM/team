package com.shop.service;

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
}
