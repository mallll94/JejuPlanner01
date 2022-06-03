package kosta.mvc.controller;

import java.time.Period;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
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
		System.out.println(DayPlanner);
		Planner planner= plannerService.selectBy(plannerId);
		//if(DayPlanner == 0) {
			
		//}else {
			//planner=plannerService.selectByDay(plannerId, DayPlanner);
		//}
		
		
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<PlannerPlace> list = planner.getPlannerPlaceList();
		
		//D-day
		Period period = Period.between(planner.getPlannerStart(), planner.getPlannerEnd());
		List<PlaceDTO> place=placeService.selectByPlanner(list);
		
		
		
			
		
			
		 
		
		
		
		
		map.put("planner", planner ); //
		map.put("plannerPlaces",  list);
		map.put("dayNo", period.getDays());
		map.put("place", place);
	
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	


}
