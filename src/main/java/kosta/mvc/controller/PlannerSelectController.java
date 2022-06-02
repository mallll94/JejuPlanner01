package kosta.mvc.controller;

import java.time.Period;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Place;
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
	public Map<String, Object> selectAll(Long placeId){
		
		Planner planner= plannerService.selectBy(placeId);
		Map<String, Object> map = new HashMap<String, Object>();
		List<PlannerPlace> list = planner.getPlannerPlaceList();
		
		//D-day
		Period period = Period.between(planner.getPlannerStart(), planner.getPlannerEnd());
		
		List<PlaceDTO> place=placeService.selectByPlanner(list);
		
		
		
		
		map.put("planner", planner );
		map.put("plannerPlaces",  list);
		map.put("dayNo", period.getDays());
		map.put("place", place);
	
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	


}
