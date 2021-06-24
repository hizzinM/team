package com.shop.mapper;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.time.LocalDateTime;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import com.shop.controller.HomeController;
import com.shop.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root_context.xml")
public class MemberMapperTest {
	@Autowired
	private MemberMapper membermapper;

	// 회원가입 쿼리 테스트 메서드
	@Test
	public void memberJoin() throws Exception {
		User user = new User();

		user.setUserNo(0);
		user.setUserId("test"); // 회원 id
		user.setPassword("test"); // 회원 비밀번호
		user.setPasswordCheck("test"); // 회원 이름
		user.setUserName("test"); // 회원 메일
		user.setAddressNum("test");
		user.setAddress("test");
		user.setAddressDetail("test");
		user.setPhone("test");
		user.setEmail("test");
		user.setAdminck(0);
		user.setRegDate(LocalDateTime.now());
		user.setAccountName("test");
		user.setAccountBank("test");
		user.setAccountNum("test");

		membermapper.memberJoin(user); // 쿼리 메서드 실행
	}

}