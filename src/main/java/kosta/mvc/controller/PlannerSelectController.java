package kosta.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.service.PlannerService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/planner")
public class PlannerSelectController {

	private final PlannerService plannerService;
	
	/*@RequestMapping("/select")
	@ResponseBody
	@JsonIgnore
	public Map<String, Object> selectAll(Long placeId){
		
		PlannerDTO planner= plannerService.selectBy(placeId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("**********************");
		
		map.put("planner",planner );
		System.out.println("**22222222*******************");
		//map.put("plannerPlaces", planner.getPlannerPlaceList());
		
	
		return map;
	}*/
	
	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> selectAll(Long placeId){
		
		Planner planner= plannerService.selectBy(placeId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("**********************");
		
		map.put("planner",planner );
		System.out.println("**22222222*******************");
		List<PlannerPlace> list = planner.getPlannerPlaceList();
		System.out.println("list = " + list);
		map.put("plannerPlaces",  list);
		
	
		return map;
	}
	
	
	/*
	@RequestMapping("/select")
	public String selectAll(@RequestParam Long placeId , Model model){
		System.out.println("플래너 아이디값 : "+placeId);
		Planner planner= plannerService.selectBy(placeId);
		
		model.addAttribute("planner", planner);
		model.addAttribute("plannerPlaces", planner.getPlannerPlaceList());
		
	
		return "/planner/plannerIndex2";
	}
*/
}
