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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
			
		Pageable pageable = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "insertDate");
		Page<Planner> pageList =plannerService.selectAllByUserIdPageing(pageable, loginUser.getUserId());
		List<Planner> plannerlist = pageList.getContent();
		List<DiaryDTO> diaryList = new ArrayList<DiaryDTO>();
		
		Period period = null;
		for(Planner d :plannerlist) {
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
	@RequestMapping("/diaryRead/{plannerId}")
	public String selectByDiaryId(Model model,@PathVariable Long plannerId) {
		/*DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일(E)");
		
		//다이어리info
		Planner dbDiary = plannerService.selectBy(plannerId);
		Period period =Period.between(dbDiary.getPlannerStart(), dbDiary.getPlannerEnd());
		DiaryDTO diary = new DiaryDTO(dbDiary.getDiaryTitle(), dbDiary.getDiaryPhoto(), dbDiary.getPlannerType(), dbDiary.getPlannerCount(),
				dbDiary.getPlannerId(), (dbDiary.getPlannerStart()).format(format),(dbDiary.getPlannerEnd()).format(format),period.getDays()+1);
		
		//다이어리 내용
		List<PlannerPlace> pplist = dbDiary.getPlannerPlaceList();
			//System.out.println("컨트롤러 pplist :: "+pplist.size() );
		List<DiaryLineDTO> diarylinelist = new ArrayList<DiaryLineDTO>();
		for(PlannerPlace p:pplist) {
		diarylinelist.add(new DiaryLineDTO(p.getPlannerPlaceId(), p.getPlanner().getPlannerId(), p.getPlace().getPlaceId(),
				p.getPlace().getPlaceName(), p.getPlace().getPlaceAddr(), p.getPlace().getPlaceContent(), p.getPlace().getPlacePhoto(), p.getPlace().getPlaceUrl(),
				p.getDiaryLineContent(), p.getDiaryLinePhoto(), p.getDiaryLinePrice(), p.getPlannerPlaceDate()));
			//System.out.println("컨트롤러 diarylinelist 다이어리 경비:: "+p.getDiaryLinePrice());
		}
		String curPage =(String)model.getAttribute("nowPage");
		System.out.println("::현재 페이지::"+curPage);

		model.addAttribute("diary", diary);
		model.addAttribute("diarylinelist", diarylinelist);
		
		*/
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일(E)");
		
		//다이어리info
		Planner dbDiary = plannerService.selectBy(plannerId);
		Period period =Period.between(dbDiary.getPlannerStart(), dbDiary.getPlannerEnd());
		DiaryDTO diary = new DiaryDTO(dbDiary.getDiaryTitle(), dbDiary.getDiaryPhoto(), dbDiary.getPlannerType(), dbDiary.getPlannerCount(),
				dbDiary.getPlannerId(), (dbDiary.getPlannerStart()).format(format),(dbDiary.getPlannerEnd()).format(format),period.getDays()+1);
		String curPage = (String)model.getAttribute("nowPage");
		System.err.println("::현재페이지::"+curPage);
		model.addAttribute("diary", diary);
		model.addAttribute("nowPage",curPage);
		
		
		return "diary/diaryRead2";
	}
	
	/**다이어리 상세조회하기*/
	@RequestMapping("/DiaryTitle")
	@ResponseBody
	public Map<String, Object> selectAllDiaryLine(Long plannerId){
		System.out.println("오나?"+plannerId);
		Map<String, Object> map = new HashMap<String, Object>();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일(E)");
		//Long.valueOf(plannerId)
		//다이어리info
		Planner dbDiary = plannerService.selectBy(plannerId);
		Period period =Period.between(dbDiary.getPlannerStart(), dbDiary.getPlannerEnd());
		DiaryDTO diary = new DiaryDTO(dbDiary.getDiaryTitle(), dbDiary.getDiaryPhoto(), dbDiary.getPlannerType(), dbDiary.getPlannerCount(),
				dbDiary.getPlannerId(), (dbDiary.getPlannerStart()).format(format),(dbDiary.getPlannerEnd()).format(format),period.getDays()+1);
		
		//다이어리 내용
		List<PlannerPlace> pplist = dbDiary.getPlannerPlaceList();
			//System.out.println("컨트롤러 pplist :: "+pplist.size() );
		List<DiaryLineDTO> diarylinelist = new ArrayList<DiaryLineDTO>();
		for(PlannerPlace p:pplist) {
		diarylinelist.add(new DiaryLineDTO(p.getPlannerPlaceId(), p.getPlanner().getPlannerId(), p.getPlace().getPlaceId(),
				p.getPlace().getPlaceName(), p.getPlace().getPlaceAddr(), p.getPlace().getPlaceContent(), p.getPlace().getPlacePhoto(), p.getPlace().getPlaceUrl(),
				p.getDiaryLineContent(), p.getDiaryLinePhoto(), p.getDiaryLinePrice(), p.getPlannerPlaceDate()));
			//System.out.println("컨트롤러 diarylinelist 다이어리 경비:: "+p.getDiaryLinePrice());
		}
		map.put("diary", diary);
		map.put("diarylinelist", diarylinelist);
		System.out.println("여긴?");

		return map;
	}
	
	
	
	
	
	/**다이어리 내용 등록하기*/
	@RequestMapping("/insertDiaryLine")
	public String insertDiaryLine(PlannerPlace diaryLine, HttpSession session) {
			System.out.println("작성 내용"+diaryLine.getDiaryLineContent());
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/diary/";
		Planner dbplanner =plannerService.insertDiaryLine(diaryLine, uploadPath);
		return "redirect:/diary/diaryRead/"+dbplanner.getPlannerId();
	}
	
//	@RequestMapping(value = "/diaryInsertAjax", method = RequestMethod.POST)
//	public PlannerPlace insertDiaryAjax(HttpSession session, PlannerPlace diaryLine) {
//			System.out.println("작성 내용"+diaryLine.getDiaryLineContent());
//		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/diary/";
//		Planner dbplanner =plannerService.insertDiaryLine(diaryLine, uploadPath);
//		
//		return diaryLine;
//	}
	
	/**다이어리 내용 수정하기*/
	@RequestMapping("/updateDiaryForm")
	@ResponseBody
	public PlannerPlace updateForm(Long diaryLineId) {
		System.out.println("수정하기::"+diaryLineId);
		PlannerPlace plannerPlace =plannerService.selectPPbyPPId(diaryLineId);
		return plannerPlace;
	}
	
	@RequestMapping("/updateDiaryLine")
	public String updateDiaryLine(PlannerPlace diaryLine, HttpSession session) {
			System.out.println("작성 내용"+diaryLine.getDiaryLineContent());
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/diary/";
		Planner dbplanner =plannerService.insertDiaryLine(diaryLine, uploadPath);
		return "redirect:/diary/diaryRead/"+dbplanner.getPlannerId();
	}
	
	
	@RequestMapping("/updateName")
	public String updateName(Planner planner) {
		System.out.println("변경할 plannerID::"+planner.getPlannerId());
		System.out.println("변경할 이름::"+planner.getDiaryTitle());
		Planner dbplanner =plannerService.updateDiaryName(planner);
		return "redirect:/diary/diaryRead/"+dbplanner.getPlannerId();
	}
	
	@RequestMapping("/updateCountAndType")
	public String updateCountAndType(Planner planner) {
		System.out.println("변경할 plannerID::"+planner.getPlannerId());
		System.out.println("변경할 타입::"+planner.getPlannerType()+", 인원:: "+planner.getPlannerCount());
		Planner dbplanner = plannerService.updateCountAndType(planner);		
		return "redirect:/diary/diaryRead/"+dbplanner.getPlannerId();
	}
	
	
	/**다이어리 내용 삭제하기*/
	@RequestMapping("/deleteDiaryLine")
	public String deleteDiaryLine(Long diaryLineId, HttpSession session) {
		PlannerPlace plannerpalce = new PlannerPlace();
			plannerpalce.setPlannerPlaceId(diaryLineId);
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/diary/";
		Planner dbplanner =plannerService.updateDiaryLine(plannerpalce, uploadPath);
		return "redirect:/diary/diaryRead/"+dbplanner.getPlannerId();
	}
	
	/**다이어리 삭제하기*/
	@RequestMapping("/delete")
	public String deleteDiary(Long diaryId) {
		System.out.println("다이어리 삭제!!!!!!");
		plannerService.deleteDiary(diaryId);
		return "redirect:/diary/diaryIndex";	
	}
}
