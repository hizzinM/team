package teampro;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
@Mapper
public interface UserMapper {

	
	@Insert("insert into user(user_no,user_id,password,password_check,user_name,address,phone,email,"
			+ "birth_date,account_name,account_bank,account_num) "
			+ "values(#{userNo},#{userId},#{password},#{passwordCheck},#{userName},#{address},#{phone},#{email},#{birthDate},#{accountName},#{accountBank},#{accountNum})")
	@Options(useGeneratedKeys = true,keyProperty ="userNo")
	public int insertuma(User user);
	
}
