package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.UserMapper;
import com.shop.model.User;

@Service
public class UserService {

	@Autowired
	UserMapper userMapper;

	public List<User> getUserList() {
		return userMapper.selectUserList();

	}

	public User getUserById(int userId) {
		return userMapper.selectByUserId(userId);
	}

	public int deleteUser(int userId) {
		return userMapper.deleteUserList(userId);
	}

	public User joinUser(User user) {

		int affactedRow = userMapper.insertUser(user);

		if (affactedRow == 1) {
			return new User(user.getUserId(), user.getPassword(), user.getPasswordCheck(),
					user.getUserName(), user.getAddressNum(), user.getAddress(), user.getAddressDetail(),
					user.getPhone(), user.getEmail(), user.getAdminck(), user.getRegDate(), user.getAccountName(),
					user.getAccountBank(), user.getAccountNum());
		} else {
			return null;

		}
	}

	public User updateUser(User user) {
		int affactedRow = userMapper.updateUserList(user);
		if (affactedRow == 1) {
			return new User(user.getUserId(), user.getPassword(), user.getPasswordCheck(),
					user.getUserName(), user.getAddressNum(), user.getAddress(), user.getAddressDetail(),
					user.getPhone(), user.getEmail(), user.getAdminck(), user.getRegDate(), user.getAccountName(),
					user.getAccountBank(), user.getAccountNum());
		} else {
			return null;

		}

	}
}
