package kosta.mvc.controller;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.CrewBoard;
import kosta.mvc.service.CrewService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CrewController {
	
	private final CrewService crewService;
	
	/**
	 * 전체검색
	 * */
//	@RequestMapping("/board/crew")
    public void list(Model model) {
    	
    	List<CrewBoard> list = crewService.selectAll();
    	
    	model.addAttribute("list", list);
    	
    }
	
	/**
	 * 전체검색 (관리자)
	 * */
	@RequestMapping("admin/crew_Admin")
    public void listForAdimin(Model model) {
		
    	List<CrewBoard> list = crewService.selectAll();
    	
    	model.addAttribute("list", list);
    	
    }
	
	/**
	 *  페이징처리
	 **/
	@RequestMapping("/board/crew")
	public void list(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		// 페이징 처리
		Pageable page = PageRequest.of(nowPage - 1, 10, Direction.DESC, "crewId");
		Page<CrewBoard> list = crewService.selectAll(page);
		
		model.addAttribute("list", list);
		
		int blockCount = 5;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;
		
		model.addAttribute("blockCount", blockCount);
		model.addAttribute("startPage", startPage);
	}
	
	/**
	 * 글 등록폼
	 * */
	 @RequestMapping("/board/crew_Write")
	 public void write() {
		 	 
	 }
	
	/**
	 * 글 등록
	 * */
	 @RequestMapping(value ="/board/crew_Insert", method = RequestMethod.POST)
	 public String insert(CrewBoard crewBoard) {
		 crewService.insertCrewBoard(crewBoard);
		 
		 return "redirect:/board/crew";
	 }

	/**
	 * 상세보기
	 * */
	@RequestMapping("/board/crew_Detail/{crewId}")
	public ModelAndView read(@PathVariable Long crewId) {
		 CrewBoard crewboard = crewService.selectById(crewId);
		 return new ModelAndView("/board/crew_Detail", "crewboard", crewboard);
	}
	
	/**
	 * 동행 구하기 완료여부
	 * */
	@RequestMapping("/board/crew_Detail/changeState") 
	public ModelAndView changeState(Long crewId,String btnradio) {
	
		 crewService.changeState(crewId,btnradio);
		 return new ModelAndView("redirect:/board/crew");
		 
		  
	}
	 
	 
	/**
	 * 수정폼
	 * */
	 @RequestMapping("/board/crew_updateForm")
	 public ModelAndView updateForm(Long crewId) {
		 CrewBoard crewBoard = crewService.selectById(crewId);
		 return new ModelAndView("/board/crew_pdate","crewboard",crewBoard);
		 
		 
	 }
	
	/**
	 * 수정하기
	 * */
	 @RequestMapping("/board/crew_update")
	 public ModelAndView update(CrewBoard crewboard) {
		 CrewBoard dbBoard = crewService.updateCrewBoard(crewboard);
		 
		 return new ModelAndView("/board/crew_Detail", "crewboard", dbBoard);
	 }
	 
	/**
	 * 삭제하기
	 * */
	 @RequestMapping("/board/crew_delete/{crewId}")
	 public String delete(@PathVariable Long crewId) {
		 crewService.deleteCrewBoard(crewId);		 
		 
		 return "redirect:/board/crew"; 
	 
	 }
	 
	 /**
		 * 삭제하기(관리자)
		 * */
	 @RequestMapping("/admin/crew_delete/{crewId}")
	 public String adDelete(@PathVariable Long crewId) {
		 crewService.deleteCrewBoard(crewId);		 
		 
		 return "redirect:/admin/crew_Admin"; 
	 
	 }
	 
	 
	 
	 
	 
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

