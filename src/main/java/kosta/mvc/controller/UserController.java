package kosta.mvc.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Users;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	
	private final UserService userService;
	private final PasswordEncoder passwordEncoder;

	
	
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
	
	
	@RequestMapping("/idcheckAjax")
	@ResponseBody
	public String idcheckAjax(String id) {
		
		return userService.idcheck(id);
	}
	
	@RequestMapping("/idFind")
	public String idFind(Users user,Model model) {
		System.out.println(user.getUserEmail()+user.getUserName()+user.getUserPhone());

		String result = userService.selectbyIdandEmail(user);

		model.addAttribute("userId", result);
		return "/user/idFindResult";
	}

	@RequestMapping("/pwdFind")
	public String pwdFind(Users user,Model model) {
		//String encodePassword=PasswordEncoder.encode(user.get);

		String result = userService.findPwdCheck(user);

		model.addAttribute("userId", result);
		String url = "";
		
		if(result=="해당하는 정보가 없습니다.") {
			url="/user/idFindResult";
		}else {
			url="/user/pwdChangeForm";
		}
		
		return url;
	}
	
	@RequestMapping("/pwdUpdate")
	public String pwdUpdate(Users user) {
		System.out.println("11111111111111111111111111");
		System.out.println(user.getUserId()+user.getUserPassword());
		String encodePassword=passwordEncoder.encode(user.getUserPassword());
		System.out.println("22222222222222222222");
		System.out.println(encodePassword);
		user.setUserPassword(encodePassword);
		System.out.println("33333333333333333333333331");
		System.out.println(user.getUserPassword());
		
		userService.findUpdatePwd(user);
		
		return "user/loginForm";
	}
	
	
	@RequestMapping(value = "/kakao/callback" , method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam String code, HttpSession session) {
		System.out.println("::카카오 로그인 인증::"+code);
		
		//접속토큰 Get
		String kakaoToken = userService.kakaoGetAccessToken(code);
		
		//접속자 정보 Get
		//Map<String, Object> result = userService.getUserInfo(kakaoToken);
		//String kakaoId = (String)result.get("id");
		
		
		return "redirect:/";
	}
	
	
	@RequestMapping("/emailCheckAjax")
	@ResponseBody
	public int emailCheckAjax(String email) {
		int result=userService.emailCheck(email);
		
		
		return result;
	}
	
	/**
	 * 마이페이지 내정보
	 **/
	@RequestMapping("/myPage")
	public ModelAndView read() {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Users dbusers = userService.selectById(users.getUserId());
		return new ModelAndView("mypage/myPage", "Users" , dbusers);
		
	}
	
	/**
	 * 회원 탈퇴하기
	 **/
	@RequestMapping("/userDelete")
	public String deleteUsers(String userPassword) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		userService.deleteUsers(users.getUserId(), userPassword);
		SecurityContextHolder.clearContext(); //저장된 정보 삭제
		return "user/loginForm";
	}
	
	/**
	 * 회원 정보수정하기
	 **/
	@RequestMapping("/userUpdate")
	public String updateUsers(HttpServletRequest request, Users users) {
		Users dbusers = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		users.setUserId(dbusers.getUserId());
		userService.updateUsers(users);
		
		return "redirect:/user/myPage";
		
	}
	
}
