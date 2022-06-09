package kosta.mvc.controller;

import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.DiaryDTO;
import kosta.mvc.dto.DiaryLineDTO;
import kosta.mvc.service.PlannerService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/diary")
@RequiredArgsConstructor
public class DiaryController {

	private final PlannerService plannerService;
	private final UserService userService;
	
	private final static int PAGE_COUNT=6;
	private final static int BLOCK_COUNT=3;
	
	/**다이어리 전체조회하기(페이징)*/
	@RequestMapping("/diaryIndex")
	public void selectAllByUserIdPageing(Model model, HttpSession session, @RequestParam(defaultValue = "1") int nowPage) {
		//Users loginUser =(Users)session.getAttribute("loginUser");
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일(E)");
		
		//임시 테스트 아이디
			String userId ="aaa";
			Users loginUser =userService.selectById(userId);
			
		Pageable pageable = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "diaryId");
		Page<Planner> pageList =plannerService.selectAllByUserIdPageing(pageable, loginUser.getUserId());
		List<DiaryDTO> diaryList = new ArrayList<DiaryDTO>();
		
		Period period = null;
		for(Planner d :pageList) {
			period =Period.between(d.getPlannerStart(), d.getPlannerEnd());
			diaryList.add(new DiaryDTO( d.getDiaryTitle(), d.getDiaryPhoto(),d.getPlannerType(),d.getPlannerCount(),
					d.getPlannerId(),(d.getPlannerStart()).format(format),(d.getPlannerEnd()).format(format),period.getDays()+1));
		System.out.println("===="+d.getDiaryTitle());
		}
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;

		/**
		 * List<Diary> dList=pageList.getContent(); 이니까
		 * view에서  {requestScope.pageList.content}로 content를 붙여야한다!
		 * */
		model.addAttribute("pageList", pageList);
		model.addAttribute("diaryList",diaryList);
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage",startPage);
		model.addAttribute("nowPage",nowPage);
	}
	
	/**다이어리 상세페이지로 이동*/
	@RequestMapping("/diaryRead/{diaryId}")
	public String selectByDiaryId(Model model,@PathVariable Long plannerId) {
		Planner diary =plannerService.selectBy(plannerId);
		model.addAttribute("diary", diary);
		return "/diary/diaryRead";
	}
	
	/**다이어리 상세조회하기*/
	@RequestMapping("/selectAllDiaryLine")
	@ResponseBody
	public List<DiaryLineDTO> selectAllDiaryLine(Long plannerId){
		Planner planner =plannerService.selectBy(plannerId);
		List<PlannerPlace> pplist = planner.getPlannerPlaceList();
		List<DiaryLineDTO> diarylinelist = new ArrayList<DiaryLineDTO>();
		for(PlannerPlace p:pplist) {
			diarylinelist.add(new DiaryLineDTO(p.getPlannerPlaceId(), p.getPlanner().getPlannerId(), p.getPlace().getPlaceId(),
					p.getPlace().getPlaceName(), p.getPlace().getPlaceAddr(), p.getPlace().getPlaceContent(), p.getPlace().getPlacePhoto(), p.getPlace().getPlaceUrl(),
					p.getDiaryLineContent(), p.getDiaryLinePhoto(), p.getDiaryLinePrice(), p.getPlannerPlaceDate()));
		}
		return diarylinelist;
	}
	
	
	/**다이어리 삭제하기*/
	
	
	/**다이어리 내용 등록하기*/
	
	/**다이어리 내용 수정하기*/
	
	/**다이어리 내용 삭제하기*/
}
