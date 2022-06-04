package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.PlanBoard;
import kosta.mvc.service.PlanBoardService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PlanBoardController {
	
	private final PlanBoardService planBoardService;
	
	/**전체검색*/
	@RequestMapping("/board/PlanboardList")
	public void planList(Model model) {
		List<PlanBoard> list = planBoardService.selectAll();
		
		System.out.println("planlist");
		
		model.addAttribute("list", list);
	}
	
	/**상세보기*/
	@RequestMapping("/board/Planboard_Detail/{pboardId}")
	public ModelAndView read(@PathVariable Long pboardId) {
		PlanBoard planBoard = planBoardService.selectById(pboardId);
		
		return new ModelAndView("board/Planboard_Detail","planBoard", planBoard);
		
	}

}
