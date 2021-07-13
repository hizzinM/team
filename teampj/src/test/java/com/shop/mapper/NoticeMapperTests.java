package com.shop.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shop.model.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root_context.xml")
public class NoticeMapperTests {
	private static final Logger log = LoggerFactory.getLogger(NoticeMapperTests.class);

	@Autowired
	private NoticeMapper noticeMapper;

	@Test
	public void testEnroll() {

		NoticeVO notice = new NoticeVO();

		notice.setNoticeTitle("mapper test");
		notice.setNoticeContent("mapper test");
		notice.setUserId("mapper test");

		noticeMapper.enroll(notice);

	}

}