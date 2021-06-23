package com.teampro.persistence;

import static org.junit.Assert.*;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shop.mapper.TimeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root_context.xml")

public class TimeMapperTest {
	@Autowired
	private TimeMapper timeMapper;

	@Test  
	public void testGetTime() {
		System.out.println(timeMapper.selectUserList());
	}
	
	@Test
	public void testGetTime2() {
		System.out.println(timeMapper.selectUserList2());
	}
}
