package kosta.mvc.controller;


import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.CrewBoard;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.CrewDTO;
import kosta.mvc.service.CrewService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CrewController {
	
	private final CrewService crewService;
	private final UserService userService;
	
	/**
	 * 전체검색 (페이징 처리)
	 * */
//	@RequestMapping("/board/crew")
    public void list(Model model) {
    	
    	List<CrewBoard> list = crewService.selectAll();
    	
    	model.addAttribute("list", list);
    	
    }
	
	/**
	 * 전체검색 관리자 (페이징처리)
	 * */
	@RequestMapping("admin/crew_Admin")
    public void listForAdimin(Model model) {
		
    	List<CrewBoard> list = crewService.selectAll();
    	
    	model.addAttribute("list", list);
    	
    }
	
	/**
	 *  페이징처리
	 **/
	/**
	 *  페이징처리
	 **/
	@RequestMapping("/board/crew")
	public void list(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		//Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//임시 테스트 아이디
		String userId ="ccc";
		Users loginUser =userService.selectById(userId);
		
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		
		// 페이징 처리
		Pageable page = PageRequest.of(nowPage - 1, 10, Direction.DESC, "crewId");
		Page<CrewBoard> list = crewService.selectAll(page);
		List<CrewBoard> clist = list.getContent();
		List<CrewDTO> crewlist = new ArrayList<CrewDTO>();
		for(CrewBoard c : clist) {
			crewlist.add(new CrewDTO(c.getCrewId(), c.getUser().getUserId(), c.getCrewTitle(), c.getCrewContent(), 
					c.getCrewState(), c.getCrewRegdate().format(format), c.getCrewUpdate().format(format)) );
		}
		
	
		int blockCount = 5;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;
		
		model.addAttribute("crewlist", crewlist);
		model.addAttribute("blockCount", blockCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
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
		//Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    //임시 테스트 아이디
		String userId ="ccc";
		Users loginUser =userService.selectById(userId);
		crewBoard.setUser(loginUser);
		 
		 crewService.insertCrewBoard(crewBoard);
		 
		 return "redirect:/board/crew";
	 }

	/**
	 * 상세보기
	 * */
	@RequestMapping("/board/crew_Detail/{crewId}")
	public String read(@PathVariable Long crewId,Model mv) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CrewBoard crewboard = crewService.selectById(crewId);
	
		mv.addAttribute("sendId", users.getUserId());
		mv.addAttribute("receId", crewboard.getUser().getUserId());
		mv.addAttribute("crewboard", crewboard);
		
		return "board/crew_Detail";
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

