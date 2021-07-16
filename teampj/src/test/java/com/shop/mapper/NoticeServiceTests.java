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
import com.shop.service.AdminService;
import com.shop.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root_context.xml")
public class NoticeServiceTests {
	private static final Logger log = LoggerFactory.getLogger(NoticeMapperTests.class);

	@Autowired
	private BoardService boardService;

	@Test
	public void testEnroll() {
		NoticeVO notice = new NoticeVO();

		notice.setNoticeTitle("service test");
		notice.setNoticeContent("service test");
		notice.setUserId("service test");

		boardService.enroll(notice);
	}

	/* 게시판 수정 */
	@Test
	public void testModify() {

		NoticeVO notice = new NoticeVO();
		notice.setBno(8);
		notice.setNoticeTitle("수정 제목");
		notice.setNoticeContent("수정 내용");

		int result = boardService.modify(notice);
		log.info("result : " + result);

	}
}
