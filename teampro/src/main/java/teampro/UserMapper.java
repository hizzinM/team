package teampro;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
@Mapper
public interface UserMapper {

	
	@Select("select*from user")
	public List<User> selectUserList();
	
	@Select("select*from user where user_no=#{userNo}")
	public User selectByUserId(int userNo);
	
	@Delete("delete from user where user_no=#{userNo}")
	public int deleteUserList(int userNo);
	
	
	@Update("update user set user_no=#{userNo},user_id=#{userId},password=#{password},"
			+ "password_check=#{passwordCheck},user_name=#{userName},address=#{address},"
			+ "phone=#{phone},email=#{email},birth_date=#{birthDate},account_name=#{accountName},account_bank=#{accountBank},account_num=#{accountNum} where user_no=#{userNo}")
		public int updateUserList(User user);
	
	@Insert("insert into user(user_no,user_id,password,password_check,user_name,address,phone,email,birth_date,account_name,account_bank,account_num) "
			+ "values(#{userNo},#{userId},#{password},#{passwordCheck},#{userName},#{address},#{phone},#{email},#{birthDate},#{accountName},#{accountBank},#{accountNum})")
	@Options(useGeneratedKeys = true,keyProperty ="userNo")
	public int insertUser(User user);
	
}
