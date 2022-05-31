package kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.Planner;
import kosta.mvc.service.PlaceService;
import kosta.mvc.service.PlannerService;

@Controller
@RequestMapping("/planner")
public class PlannerCreateController {

	@Autowired
	private PlannerService plannerService;
	@Autowired
	private PlaceService placeService;
	
	
	@RequestMapping("/{url}")
	public void init() {
		
	}
	
	@RequestMapping("/plannerIndex")
	public void selectAllByUserID(Model model/* , String userId */){
		//임시 테스트 아이디
		String userId ="aaa";
		List<Planner> plist = plannerService.selectAll(userId);
		model.addAttribute("plannerList",plist);
		
	}
	
	@RequestMapping("/plannerWrite/{plannerId}")
	public String wirteForm(@PathVariable Long plannerId, Model model) {
		Planner planner =plannerService.selectBy(plannerId);
		model.addAttribute("planner", planner);
		return "/planner/plannerWrite";
	}
	
	
	
	/**오른쪽 사이드바에서 카테고리별 추천받기*/
	@RequestMapping("/recommend")
	@ResponseBody
	public List<Place> recommendCategory(String category) {
		//개수제한 하는 로직 필요함!!! 전체가져오면 X
		System.out.println(category);
		//List<Place> plist =null;
		List<Place> plist =placeService.selectByCata("placeSave", category);
		return plist;
	}
	
	/**오른쪽 사이드바에서 장소추가하기*/
	@RequestMapping("/addPlace")
	@ResponseBody
	public void addPlace() {
		
	}
	
	/**왼쪽 사이드바에서 기간정하기*/
	//@RequestMapping("/setDate")
	//@ResponseBody
	
	
	
	/***/
	
}
