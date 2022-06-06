package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import kosta.mvc.domain.FreeBoard;
import kosta.mvc.service.FreeBoardService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FreeBoardController {

	private final FreeBoardService freeBoardService;
	
	/**
	 * 전체검색
	**/
	
	@RequestMapping("/board/freeBoard")
	public void list(Model model) {
		
		List<FreeBoard> list = freeBoardService.getAllFreeBoards();
		
		model.addAllAttributes(list);
			
	} 
	
	/**
	 * 전체검색 관리자
	 **/
	@RequestMapping("/admin/freeBoard_Admin") 
	public void listForAdmin(Model model) {
		
	    List<FreeBoard> list = freeBoardService.getAllFreeBoards();
		
		model.addAllAttributes(list);
	}
	
	/**
	 *  페이징처리
	 **/
	@RequestMapping("/board/freeBoard")
	public void list(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		// 페이징 처리
		Pageable page = PageRequest.of(nowPage - 1, 10, Direction.DESC, "freeId");
		Page<FreeBoard> list = freeBoardService.getAllFreeBoards(page);
		
		model.addAttribute("list", list);
		
		int blockCount = 5;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;
		
		model.addAttribute("blockCount", blockCount);
		model.addAttribute("startPage", startPage);
	}
	
	/**
	  * 글 등록폼
	  **/
	@RequestMapping("/board/feeBoard_Write")
	public void write() {
		
	}
	
	/**
	 * 글 등록
	 **/
	@RequestMapping(value = "/board/insert", method = RequestMethod.POST)
	public String insert(FreeBoard freeBoard, HttpSession session) {
		
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/freeBoard/";
		freeBoardService.addFreeBoard(freeBoard, uploadPath);
		
		return "redirect:/board/freeBoard";
		
	}
	
	/**
	 * 상세보기
	 **/
	@RequestMapping("board/freeBoard_Detail/{freeId}")
	public ModelAndView read(@PathVariable Long freeId) {
		FreeBoard freeBoard = freeBoardService.getFreeBoard(freeId, true);
		return new ModelAndView("board/freeBoard_Detail", "freeBoard", freeBoard);
	}
	
	/**
	 * 수정폼
	 **/
	@RequestMapping("board/freeBoard_updateForm")
	public ModelAndView updateForm(Long freeId) {
		FreeBoard freeBoard = freeBoardService.getFreeBoard(freeId, false);
		return new ModelAndView("board/freeBoard_Update", "freeBoard", freeBoard);
		
	}
		
	/**
	 * 수정하기
	 **/
    @RequestMapping(value = "board/freeBoard_update", method = RequestMethod.POST)
    public ModelAndView update(FreeBoard freeBoard, HttpSession session) {
    	
    	String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/freeBoard/";
    	FreeBoard dbBoard = freeBoardService.updateFreeBoard(freeBoard, uploadPath);
    	
    	return new ModelAndView("board/freeBoard_Detail", "freeBoard", freeBoard);
    }
	
	/**
	 * 삭제하기
	 **/
    @RequestMapping("/board/freeBoard_delete/{freeId}")
	 public String delete(@PathVariable Long freeId) {
		 freeBoardService.deleteFreeBoard(freeId);		 
		 
		 return "redirect:/board/freeBoard"; 
	 
	 }
	
	/**
	* 삭제하기(관리자)
	 **/
    @RequestMapping("/admin/freeBoard_delete/{freeId}")
	 public String adDelete(@PathVariable Long freeId) {
   	 freeBoardService.deleteFreeBoard(freeId);		 
		 
		 return "redirect:/admin/freeBoard_Admin"; 
	 
	 }
	 	
	
}