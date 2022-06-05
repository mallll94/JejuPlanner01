package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		
		System.out.println("list" + list.size());
		System.out.println("planlist");
		
		model.addAttribute("list", list);
	}
	
	
	/**플래너게시판 마이페이지 작성한 글 목록 조회*/
	
	
	
	/**상세보기*/
	@RequestMapping("/board/Planboard_Detail/{pboardId}")
	public ModelAndView read(@PathVariable Long pboardId) {
		PlanBoard planBoard = planBoardService.selectById(pboardId);
		
		System.out.println("나와라");
		
		return new ModelAndView("board/Planboard_Detail","planBoard", planBoard);
		
	}
	
	
	/**등록 폼*/
	@RequestMapping("/board/Planboard_Write")
	public void write() {
		System.out.println("write");
	}
	
	/**등록하기*/
	@RequestMapping(value= "/board/pinsert", method = RequestMethod.POST)
	public String insert(PlanBoard planBoard , HttpSession session) {
		
		String uploadpath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/planboard/";
		planBoardService.insertPlanBoard(planBoard, uploadpath);

		System.out.println("pboardinsert");
		
		return "redirect:/board/PlanboardList";
		
	}
	
	/**수정 폼*/
	@RequestMapping("/board/Planboard_Update")
	public ModelAndView updateForm (Long pboardId) {
		PlanBoard planBoard = planBoardService.selectById(pboardId);
		
		System.out.println("update");
		
		return new ModelAndView("/board/Planboard_Update", "planBoard" , planBoard);
	}
	
	/**수정하기*/
	@RequestMapping(value = "board/pupdate" , method = RequestMethod.POST)
	public String update(PlanBoard planBoard , HttpSession session) {
		String uploadpath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/planboard/";
	    PlanBoard dbBoard = planBoardService.updatePlanBoard(planBoard, uploadpath);
	    
	    System.out.println("pboardupdate");
	    
	    return "redirect:/board/Planboard_Update/" + dbBoard.getPboardId();
	
	}
	
	/**삭제하기*/
	@RequestMapping("/pdelete")
	public String delete(Long pboardId) {
		planBoardService.deletePlanBoard(pboardId);
		
		System.out.println("pboarddelete");
		
		return "redirect:/board/PlanboardList";
		
	}

}
