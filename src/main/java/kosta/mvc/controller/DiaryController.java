package kosta.mvc.controller;

import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
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
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/diary")
@RequiredArgsConstructor
public class DiaryController {

	private final PlannerService plannerService;
	
	private final static int PAGE_COUNT=6;
	private final static int BLOCK_COUNT=3;
	
	/**다이어리 전체조회하기(페이징)*/
	@RequestMapping("/diaryIndex")
	public void selectAllByUserIdPageing(Model model, HttpSession session, @RequestParam(defaultValue = "1") int nowPage) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일(E)");
	
		Pageable pageable = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "insertDate");
		Page<Planner> pageList =plannerService.selectAllDiaryPageing(pageable, users.getUserId());
		List<Planner> plannerlist = pageList.getContent();
		List<DiaryDTO> diaryList = new ArrayList<DiaryDTO>();
		
		Period period = null;
		for(Planner d :plannerlist) {
			period =Period.between(d.getPlannerStart(), d.getPlannerEnd());
			diaryList.add(new DiaryDTO( d.getDiaryTitle(), d.getDiaryPhoto(),d.getPlannerType(),d.getPlannerCount(),
					d.getPlannerId(),(d.getPlannerStart()).format(format),(d.getPlannerEnd()).format(format),period.getDays()+1));
		}
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;

		model.addAttribute("pageList", pageList);
		model.addAttribute("diaryList",diaryList);
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage",startPage);
		model.addAttribute("nowPage",nowPage);
	}
	
	/**다이어리 상세페이지로 이동*/
	@RequestMapping("/diaryRead/{plannerId}")
	public String selectByDiaryId(Model model,@PathVariable Long plannerId, int nowPage) {
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일(E)");
		
		//다이어리info
		Planner dbDiary = plannerService.selectBy(plannerId);
		Period period =Period.between(dbDiary.getPlannerStart(), dbDiary.getPlannerEnd());
		DiaryDTO diary = new DiaryDTO(dbDiary.getDiaryTitle(), dbDiary.getDiaryPhoto(), dbDiary.getPlannerType(), dbDiary.getPlannerCount(),
				dbDiary.getPlannerId(), (dbDiary.getPlannerStart()).format(format),(dbDiary.getPlannerEnd()).format(format),period.getDays()+1);

		model.addAttribute("diary", diary);
		model.addAttribute("nowPage",nowPage);

		return "diary/diaryRead2";
	}
	
	/**다이어리 상세조회하기*/
	@RequestMapping("/DiaryTitle")
	@ResponseBody
	public Map<String, Object> selectAllDiaryLine(Long plannerId){
		Map<String, Object> map = new HashMap<String, Object>();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일(E)");

		Planner dbDiary = plannerService.selectBy(plannerId);
		Period period =Period.between(dbDiary.getPlannerStart(), dbDiary.getPlannerEnd());
		DiaryDTO diary = new DiaryDTO(dbDiary.getDiaryTitle(), dbDiary.getDiaryPhoto(), dbDiary.getPlannerType(), dbDiary.getPlannerCount(),
				dbDiary.getPlannerId(), (dbDiary.getPlannerStart()).format(format),(dbDiary.getPlannerEnd()).format(format),period.getDays()+1);
		
		//다이어리 내용
		List<PlannerPlace> pplist = dbDiary.getPlannerPlaceList();
		List<DiaryLineDTO> diarylinelist = new ArrayList<DiaryLineDTO>();
		int totalPrice=0;		
		for(PlannerPlace p:pplist) {
		diarylinelist.add(new DiaryLineDTO(p.getPlannerPlaceId(), p.getPlanner().getPlannerId(), p.getPlace().getPlaceId(),
				p.getPlace().getPlaceName(), p.getPlace().getPlaceAddr(), p.getPlace().getPlaceContent(), p.getPlace().getPlacePhoto(), p.getPlace().getPlaceUrl(),
				p.getDiaryLineContent(), p.getDiaryLinePhoto(), p.getDiaryLinePrice(), p.getPlannerPlaceDate()));
			totalPrice+=(p.getDiaryLinePrice());
		}
		int total =diarylinelist.size();
		map.put("diary", diary);
		map.put("diarylinelist", diarylinelist);
		map.put("total", total);
		map.put("totalPrice", totalPrice);

		return map;
	}
	
	
	
	
	
	/**다이어리 내용 등록하기*/
	@RequestMapping("/insertDiaryLine")
	public String insertDiaryLine(PlannerPlace diaryLine, HttpSession session,int nowPage) {
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/diary/";
		Planner dbplanner =plannerService.insertDiaryLine(diaryLine, uploadPath);
		return "redirect:/diary/diaryRead/"+dbplanner.getPlannerId()+"?nowPage="+nowPage;
	}
	
	/**다이어리 내용 수정하기*/
	@RequestMapping("/updateDiaryForm")
	@ResponseBody
	public PlannerPlace updateForm(Long diaryLineId) {
		PlannerPlace plannerPlace =plannerService.selectPPbyPPId(diaryLineId);
		return plannerPlace;
	}
	
	@RequestMapping("/updateDiaryLine")
	public String updateDiaryLine(PlannerPlace diaryLine, HttpSession session,int nowPage) {
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/diary/";
		Planner dbplanner =plannerService.insertDiaryLine(diaryLine, uploadPath);
		return "redirect:/diary/diaryRead/"+dbplanner.getPlannerId()+"?nowPage="+nowPage;
	}
	
	
	@RequestMapping("/updateName")
	public String updateName(Planner planner,int nowPage) {
		Planner dbplanner =plannerService.updateDiaryName(planner);
		return "redirect:/diary/diaryRead/"+dbplanner.getPlannerId()+"?nowPage="+nowPage;
	}
	
	@RequestMapping("/updateCountAndType")
	public String updateCountAndType(Planner planner,int nowPage) {
		Planner dbplanner = plannerService.updateCountAndType(planner);		
		return "redirect:/diary/diaryRead/"+dbplanner.getPlannerId()+"?nowPage="+nowPage;
	}
	
	
	/**다이어리 내용 삭제하기*/
	@RequestMapping("/deleteDiaryLine")
	public String deleteDiaryLine(Long diaryLineId, HttpSession session,int nowPage) {
		PlannerPlace plannerpalce = new PlannerPlace();
			plannerpalce.setPlannerPlaceId(diaryLineId);
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/diary/";
		Planner dbplanner =plannerService.updateDiaryLine(plannerpalce, uploadPath);
		return "redirect:/diary/diaryRead/"+dbplanner.getPlannerId()+"?nowPage="+nowPage;
	}
	
	/**다이어리 삭제하기*/
	@RequestMapping("/delete")
	public String deleteDiary(Long plannerId) {
		plannerService.deleteDiary(plannerId);
		return "redirect:/diary/diaryIndex";	
	}
}
