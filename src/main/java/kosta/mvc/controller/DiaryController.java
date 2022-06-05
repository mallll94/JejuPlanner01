package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Diary;
import kosta.mvc.domain.Users;
import kosta.mvc.service.DiaryService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/diary")
@RequiredArgsConstructor
public class DiaryController {

	private final DiaryService diaryservice;
	private final UserService userService;
	
	@RequestMapping("/{url}")
	public void init() {}
	
	/**다이어리 전체 조회하기*/
	@RequestMapping("/diaryIndex")
	public void selectAllByUserId(Model model, HttpSession session) {
		//Users loginUser =(Users)session.getAttribute("loginUser");
		//임시 테스트 아이디
			String userId ="aaa";
			Users loginUser =userService.selectById(userId);
		
		List<Diary> diaryList = diaryservice.selectAll(loginUser.getUserId());
		model.addAttribute("diaryList", diaryList);
	}
	
	
	
	/**다이어리 상세 조회하기*/
	//@RequestMapping("/diaryRead/{diaryId}")
	//public String 
	
	
	/**다이어리 삭제하기*/
	
	
	/**다이어리 내용 등록하기*/
	
	/**다이어리 내용 수정하기*/
	
	/**다이어리 내용 삭제하기*/
	
	
}
