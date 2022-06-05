package kosta.mvc.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Users;
import kosta.mvc.service.EmailService;
import kosta.mvc.service.EmailServiceImpl;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	
	private final UserService userService;
	private final EmailService emailService;
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
	

	@PostMapping("/mail")
	@ResponseBody
	public void emailConfirm(String userId)throws Exception{
		logger.info("post emailConfirm");
		System.out.println("전달 받은 이메일 : "+userId);
		emailService.sendSimpleMessage(userId);	
	}
	
	@PostMapping("/verifyCode")
	@ResponseBody
	public int verifyCode(String code) {
		logger.info("Post verifyCode");
		
		int result = 0;
		System.out.println("code : "+code);
		System.out.println("code match : "+ EmailServiceImpl.ePw.equals(code));
		if(EmailServiceImpl.ePw.equals(code)) {
			result =1;
		}
		
		return result;
	}
	
}
