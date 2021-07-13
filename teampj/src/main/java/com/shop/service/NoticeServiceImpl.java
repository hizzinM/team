package com.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.NoticeMapper;
import com.shop.model.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticemapper;

	@Override
	public void enroll(NoticeVO notice) {
		noticemapper.enroll(notice);
	}
}
