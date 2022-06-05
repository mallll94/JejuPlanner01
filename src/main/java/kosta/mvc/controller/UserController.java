package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping("/{url}")
	public void init() {}
	
	@RequestMapping("/login")
	public void login() {} 
}
