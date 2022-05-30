package kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
