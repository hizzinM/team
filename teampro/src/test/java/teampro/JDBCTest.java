package teampro;

import static org.junit.Assert.assertNotNull;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teampro.mapper.UserMapper;
import com.teampro.model.User;
import com.teampro.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/springContext.xml")
public class JDBCTest {
	@Autowired
	UserMapper userMapper;

	@Autowired
	UserService userService;

	@Test
	public void test() {
		assertNotNull(userMapper);
		assertNotNull(userService);

		// 삽입테스트
		// messageMapper.insertMsg(new MessageDto(2, "희진", "희진123", "테스트",
		// LocalDateTime.now(), LocalDateTime.now()));

		// 수정테스트
		// int affectedRows = messageMapper.updateMsg(new MessageDto(2, "희진", "희진123",
		// "테스트1", LocalDateTime.now(), LocalDateTime.now()));
		// 삭제테스트
		// messageMapper.deleteMsg(2);

		// 조회테스트
		// List<MessageDto> msg = messageMapper.selectMsgList();
		// for (MessageDto messageDto : msg) {
		// System.out.println(messageDto);
		// }
	}

	@Test
	@Ignore
	public void getMessageListTest() {
		List<User> userList = userService.getUserList();
		for (User user : userList) {
			System.out.println(user);
		}
	}

}