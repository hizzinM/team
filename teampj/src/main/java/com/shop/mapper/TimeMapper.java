package com.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.shop.model.User;

@Mapper
public interface TimeMapper {
	@Select("select*from user")
	public List<User> selectUserList();
	
	public List<User> selectUserList2();
}
