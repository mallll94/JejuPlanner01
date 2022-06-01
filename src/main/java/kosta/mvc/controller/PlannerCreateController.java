package kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
	
	private final static int PLACE_PAGE_COUNT=10;
	
	
	@RequestMapping("/{url}")
	public void init() {
		
	}
	/**플래너 전체조회하기*/
	@RequestMapping("/plannerIndex")
	public void selectAllByUserID(Model model/* , String userId */){
		//임시 테스트 아이디
		String userId ="aaa";
		List<Planner> plist = plannerService.selectAll(userId);
		model.addAttribute("plannerList",plist);
		
	}
	
	/**플래너 작성하기1로 이동*/
	@RequestMapping("/plannerWrite/{plannerId}")
	public String wirteForm(@PathVariable Long plannerId, Model model) {
		Planner planner =plannerService.selectBy(plannerId);
		model.addAttribute("planner", planner);
		return "/planner/plannerWrite";
	}
	
	/**플래너 등록하기 > 플래너 작성하기2로 이동*/
	@RequestMapping("/plannerInsert")
	public String insert(Planner planner) {
		
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
	
	
	
	/**오른쪽 사이드바에서 장소추가하기 >> 장소 아이디로 장소 검색하기*/
	@RequestMapping("/addPlace")
	@ResponseBody
	public Place addPlace(Long placeId) {
		Place dbplace =placeService.selectById(placeId);
		return dbplace;
	}
	
	/**왼쪽 사이드바에서 기간정하기*/
	//@RequestMapping("/setDate")
	//@ResponseBody
	
	
	
	/**플래너 작성하기2로 이동*/
	
	
}
