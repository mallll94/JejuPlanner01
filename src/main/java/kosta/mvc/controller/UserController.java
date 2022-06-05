package kosta.mvc.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import kosta.mvc.domain.Users;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	
	private final UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	@RequestMapping("/{url}")
	public void init() {}
	
	@RequestMapping("/login")
	public void login() {} 
	
	@RequestMapping("/register")
	public String insertUser(Users user, String year, String month, String day) {
		System.out.println("user.getUserEmail()"+user.getUserEmail());
		System.out.println("user.getUserPhone()"+user.getUserPhone());
		userService.insertUsers(user);
		
		return "redirect:/";
	}
	

	
}
