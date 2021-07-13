package com.shop.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shop.model.NoticeVO;
import com.shop.service.AdminService;
import com.shop.service.NoticeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root_context.xml")
public class NoticeServiceTests {

	@Autowired
	private NoticeService noticeService;

	@Test
	public void testEnroll() {
		NoticeVO notice = new NoticeVO();

		notice.setNoticeTitle("service test");
		notice.setNoticeContent("service test");
		notice.setUserId("service test");

		noticeService.enroll(notice);
	}
}
