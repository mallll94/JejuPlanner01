package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
		if(plannerId==00) {
				//임시 테스트 아이디
				String userId ="aaa";
				Users loginUser =userService.selectById(userId);

			Planner planner = new Planner(loginUser);
			plannerService.insertPlan(planner);
			model.addAttribute("planner", planner);
		}else {
			Planner planner = plannerService.selectBy(plannerId);
			model.addAttribute("planner", planner);
		}
		return "/planner/plannerWrite";
	}
	
	/**플래너 상세 조회하기*/
	@RequestMapping("/selectBy")
	@ResponseBody
	public Planner selectBy(Long plannerId) {
		Planner dbplanner =plannerService.selectBy(plannerId);
		return dbplanner;
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
	
	/**왼쪽 사이드바에서 기간정하기*/
	@RequestMapping("/setDate")
	@ResponseBody
	public void setDate() {}
	
	
	/**플래너 등록하기 > 플래너 작성하기2로 이동*/
	@RequestMapping("/insert")
	public String insert(/*
							 * Model model ,Planner planner, @ModelAttribute(value = "PlannerPlaceListDTO")
							 * PlannerPlaceListDTO placelist
							 */ String plannerStart) {
		System.out.println("왔다!");
		System.out.println("컨트롤러!!: "+plannerStart);
		return null;
	}

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
