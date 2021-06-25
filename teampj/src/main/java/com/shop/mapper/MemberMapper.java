package com.shop.mapper;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.shop.model.User;

@Mapper
public interface MemberMapper {
	public void memberJoin(User user);

	/* 로그인 기능 */
	public User memberLogin(User user);
	// 아이디 중복 검사
		public int idCheck(String memberId);
}
