package kosta.mvc.controller;

import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.dto.PlaceDTO;
import kosta.mvc.service.PlaceService;
import kosta.mvc.service.PlannerService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/planner")
public class PlannerSelectController {

	private final PlannerService plannerService;
	
	private final PlaceService placeService;

	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> selectAll(Long plannerId,int DayPlanner){
		
		Map<String, Object> map = new HashMap<String, Object>();
		Planner planner= plannerService.selectBy(plannerId);
		List<PlannerPlace> list = null;
		List<PlannerPlace> boxList = new ArrayList<>();
		
		Period period = Period.between(planner.getPlannerStart(), planner.getPlannerEnd());

		if(DayPlanner==0) {
			list = planner.getPlannerPlaceList();
			
		}else {
			for(int i=0;i<planner.getPlannerPlaceList().size();i++) {
				if(planner.getPlannerPlaceList().get(i).getPlannerPlaceDate()==DayPlanner) {				
					boxList.add(planner.getPlannerPlaceList().get(i));
				}
			}
			
			list = boxList;
		}
		//D-day
		
		List<PlaceDTO> place=placeService.selectByPlanner(list);
		
		for(PlaceDTO x :place) {
			System.out.println(x.getPlaceName());
		}
		map.put("planner", planner ); //
		map.put("plannerPlaces",  list);
		map.put("dayNo", period.getDays());
		map.put("place", place);
	
		return map;
	}
	
	@RequestMapping("/nameUpdate")
	public String nameUpdate(Planner planner) {
		System.out.println("잘오는거맞아?");
		plannerService.updatePlan(planner);
		
		
		return "redirect:/planner/plannerIndex2";
	}
	
	
	
	@RequestMapping("/plannerDelete")
	public String plannerDelete(Long plannerId) {
		System.out.println(plannerId);
		plannerService.deletePlan(plannerId);
		
		
		return "redirect:/planner/plannerIndex";
	}
	
	
	@RequestMapping("/plannerShareBoard")
	public String PlannerShareBoard(Long plannerId,Model model) {
		System.out.println(plannerId);

		
		Planner planner=plannerService.selectBy(plannerId);
		model.addAttribute("planner", planner);
		//플래너 공유 게시판 주소 적용해야함
		return "planner/plannerIndex";
	}
	
	
	
	
	
	


}
