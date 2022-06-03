package kosta.mvc.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.domain.Users;
import kosta.mvc.service.PlaceService;
import kosta.mvc.service.PlannerService;
import kosta.mvc.service.UserService;

@Controller
@RequestMapping("/planner")
public class PlannerCreateController {

	@Autowired
	private PlannerService plannerService;
	//@Autowired

	@Autowired
	private PlaceService placeService;
	@Autowired
	private UserService userService;
	
	private final static int PLACE_PAGE_COUNT=10;
	
	
	@RequestMapping("/{url}")
	public void init() {
		
	}
	/**플래너 전체조회하기*/
	@RequestMapping("/plannerIndex")
	public void selectAllByUserID(Model model/* , String userId */){
		//임시 테스트 아이디
		String userId ="aaa";
		Users loginUser =userService.selectById(userId);
		
		List<Planner> plist = plannerService.selectAll(loginUser.getUserId());
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("plannerList",plist);
		
	}
	
	/**플래너 작성하기1로 이동*/
	@RequestMapping("/plannerWrite/{plannerId}")
	public String wirteForm(@PathVariable Long plannerId, Model model, HttpSession session) {
		//Users userId =(Users)session.getAttribute("loginUser");
		//기존에 있던 플래너라면
		if(plannerId!=00) {
			Planner planner = plannerService.selectBy(plannerId);
			model.addAttribute("planner", planner);
		}
		return "/planner/plannerWrite";
	}
	
	/**플래너 상세 조회하기*/
	@RequestMapping("/selectBy")
	@ResponseBody
	public Map<String, Object> selectBy(Long plannerId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Planner dbplanner =plannerService.selectBy(plannerId);
		
		Period period = Period.between(dbplanner.getPlannerStart(), dbplanner.getPlannerEnd());
		List<PlannerPlace> placelist= dbplanner.getPlannerPlaceList();
		map.put("planner", dbplanner);
		map.put("Dday", period.getDays());
		map.put("plannerPlace", placelist);
		return map;
	}
	
	/**오른쪽 사이드바에서 장소추가하기 >> 장소 아이디로 장소 검색하기*/
	@RequestMapping("/addPlace")
	@ResponseBody
	public Place addPlace(Planner planner, Long placeId) {
		Place dbplace =placeService.selectById(placeId);

			//임시 테스트 아이디
			String userId ="aaa";
			Users loginUser =userService.selectById(userId);
		
		plannerService.insertPlanPlace(new PlannerPlace(null, loginUser, planner, dbplace, 0));
		return dbplace;
	}
	
	/**기존플래너 날짜 수정*/
	@RequestMapping("updateDate")
	//@DateTimeFormat(pattern = "yyyy. m. dd.")
	@ResponseBody
	public Map<String, Object> updateDate(Long plannerId,String plannerStart,String plannerEnd){
		Map<String, Object> map = new HashMap<String, Object>();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("M/dd/yyyy");
		LocalDate startDate = LocalDate.parse(plannerStart,format);
		LocalDate endDate = LocalDate.parse(plannerEnd,format);
		
		Planner planner =plannerService.selectBy(plannerId);
			planner.setPlannerStart(startDate);
			planner.setPlannerEnd(endDate);
		plannerService.updatePlan(planner);
		
		//D-day
		Period period = Period.between(planner.getPlannerStart(), planner.getPlannerEnd());
		List<PlannerPlace> placelist= planner.getPlannerPlaceList();
		map.put("planner", planner);
		map.put("Dday", period.getDays());
		map.put("plannerPlace", placelist);
		return map;
	}
	
	/**새로운 플래너 생성하기*/
	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, Object> insert(String plannerStart,String plannerEnd) {
		
		//임시 테스트 아이디
		String userId ="aaa";
		Users loginUser =userService.selectById(userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("M/dd/yyyy");
		LocalDate startDate = LocalDate.parse(plannerStart,format);
		LocalDate endDate = LocalDate.parse(plannerEnd,format);
			
		Planner newplanner = new Planner(loginUser);
			newplanner.setPlannerStart(startDate);
			newplanner.setPlannerEnd(endDate);
		plannerService.insertPlan(newplanner);
		
		//D-day
		Period period = Period.between(newplanner.getPlannerStart(), newplanner.getPlannerEnd());
		List<PlannerPlace> placelist= newplanner.getPlannerPlaceList();
		map.put("planner", newplanner);
		map.put("Dday", period.getDays());
		map.put("plannerPlace", placelist);
		
		return map;
		
	}
	
	
	/**플래너 등록하기 > 플래너 작성하기2로 이동*/
	/*
	@RequestMapping("/insert")
	public String insert( String plannerStart) {
		System.out.println("왔다!");
		System.out.println("컨트롤러!!: "+plannerStart);
		return null;
	}*/

	/**오른쪽 사이드바에서 카테고리별 추천받기*/
	@RequestMapping("/recommend")
	@ResponseBody
	public List<Place> recommendCategory(String category) {
		Page<Place> dblist =placeService.selectByCata("placeSave", category,1,PLACE_PAGE_COUNT);
		List<Place> plist = dblist.getContent();
		return plist;
	}

	
	
	
	
	/**플래너 작성하기2로 이동*/
	
	
}
