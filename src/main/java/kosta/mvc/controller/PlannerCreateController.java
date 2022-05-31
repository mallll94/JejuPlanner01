package kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Planner;
import kosta.mvc.service.PlannerService;

@Controller
@RequestMapping("/planner")
public class PlannerCreateController {

	@Autowired
	private PlannerService service;
	
	
	@RequestMapping("/plannerIndex")
	public String selectAllByUserID(Model model/* , String userId */){
		
		List<Planner> plist = service.selectAll("aaa");
		model.addAttribute("plannerList",plist);
		return "/planner/plannerIndex";
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
