package com.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class UserController {
	@Autowired
	UserService userService;
	
	@GetMapping("/input")
	public String showUserInput() {
		return "userinputForm";
	}
	@PostMapping("/input")
	public String inputUserTest(Model model,User user) {
		User resultUser=userService.joinUser(user);
		model.addAttribute("resultUser",resultUser);
		return "result";
	}
	
//	@GetMapping("/list")
//	public String showUserList(Model model) {
//	List<User> userlist=userService.getUserList();
//		model.addAttribute("userlist",userlist);
//		return "userlist";
//	}
	@GetMapping("/update")
	public String showUserUpDate(Model model,int userNo) {
		User user=userService.getUserById(userNo);
		model.addAttribute("user",user);
		return "updateForm";
	}
	@PostMapping("/update")
	public String updateUserview(Model model,User user) {
		User resultUser=userService.updateUser(user);
		model.addAttribute("resultUser",resultUser);
		return "result";
	}
	@GetMapping("/delete")
	public String showdeleteUser(int userNo) {
		userService.deleteUser(userNo);
		return "deleteview";

	}
}
