package kosta.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Diary;
import kosta.mvc.domain.DiaryLine;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.DiaryLineDTO;
import kosta.mvc.service.DiaryService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/diary")
@RequiredArgsConstructor
public class DiaryController {

	private final DiaryService diaryservice;
	private final UserService userService;
	
	private final static int PAGE_COUNT=1;
	private final static int BLOCK_COUNT=1;
	
	@RequestMapping("/{url}")
	public void init() {}
	
	/**다이어리 전체 조회하기*/
	/*@RequestMapping("/diaryIndex")
	public void selectAllByUserId(Model model, HttpSession session) {
		//Users loginUser =(Users)session.getAttribute("loginUser");
		//임시 테스트 아이디
			String userId ="aaa";
			Users loginUser =userService.selectById(userId);
		
		List<Diary> diaryList = diaryservice.selectAll(loginUser.getUserId());
		model.addAttribute("diaryList", diaryList);
	}*/
	
	/**다이어리 전체 조회하기*/
	@RequestMapping("/diaryIndex")
	public void selectAllByUserIdPageing(Model model, HttpSession session, @RequestParam(defaultValue = "1") int nowPage) {
		//Users loginUser =(Users)session.getAttribute("loginUser");
		//임시 테스트 아이디
			String userId ="aaa";
			Users loginUser =userService.selectById(userId);
			
		Pageable pageable = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "diaryId");
		Page<Diary> pageList =diaryservice.selectAllPageing(pageable, loginUser.getUserId());
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;
		
		
		/**
		 * List<Diary> dList=pageList.getContent(); 이니까
		 * view에서  {requestScope.pageList.content}로 content를 붙여야한다!
		 * */
		model.addAttribute("pageList",pageList);
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage",startPage);
		model.addAttribute("nowPage",nowPage);
	}
	
	
	
	/**다이어리 상세 조회하기*/
	@RequestMapping("/diaryRead/{diaryId}")
	public Map<String, Object> selectByDiaryId(@PathVariable Long diaryId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Diary diary =diaryservice.selectById(diaryId);
		List<DiaryLine> dlist = diary.getDiaryLineList();
		//List<DiaryLineDTO> diarylineList = dlist.
		return map;
	}
	
	
	/**다이어리 삭제하기*/
	
	
	/**다이어리 내용 등록하기*/
	
	/**다이어리 내용 수정하기*/
	
	/**다이어리 내용 삭제하기*/
	
	
}
