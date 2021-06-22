package user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class UserService {

	@Autowired
	UserMapper userMapper;
	
	public User joinUser(User user) {
		
		int affactedRow=userMapper.insertuma(user);
		
		if(affactedRow == 1) {
				return new User(user.getUserNo(),user.getUserId(),user.getPassword(),user.getPasswordCheck(),user.getUserName(),user.getAddress(),
						user.getPhone(),user.getEmail(),user.getBirthDate(),user.getAccountName(),user.getAccountBank(),user.getAccountNum());
		}else {
			return null;
		
		}
	}
	
}
