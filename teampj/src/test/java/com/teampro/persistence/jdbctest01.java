package com.teampro.persistence;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test; 
public class jdbctest01 {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void test() {
		try (Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=Asia/Seoul", "root", "mysql")) {
			System.out.println(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
