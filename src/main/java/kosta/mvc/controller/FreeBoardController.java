package kosta.mvc.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.CrewBoard;
import kosta.mvc.domain.FreeBoard;
import kosta.mvc.domain.PlanBoard;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.FreeBoardDTO;
import kosta.mvc.service.FreeBoardService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FreeBoardController {

	private final FreeBoardService freeBoardService;
	
	
	private final static int PAGE_COUNT=5;
	private final static int BLOCK_COUNT=10;
	
	/**
	 * 전체검색 (페이징 처리)
	**/
	
	@RequestMapping("/board/freeBoard")
	public void list(Model model, @RequestParam(defaultValue = "1") int nowPage, String freeCategory) {
		
		
	    //Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
	    	
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		
		Page<FreeBoard> pageList = freeBoardService.selectByCate(freeCategory, nowPage, PAGE_COUNT);
		List<FreeBoard> list = pageList.getContent();
        List<FreeBoardDTO> freelist =new ArrayList<FreeBoardDTO>();
		
		for(FreeBoard f:list) {
			freelist.add(new FreeBoardDTO(f.getFreeId(), f.getUser().getUserId(), f.getFreeCategory(), f.getFreeTitle(),
					f.getFreeContent(), f.getFreeAttach(), f.getFreeReadnum(), f.getFreeRegdate().format(format), f.getFreeUpdate().format(format)));
		}
 		
 		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("freelist", freelist);
		model.addAttribute("totalPage",pageList.getTotalPages());
        model.addAttribute("blockCount", BLOCK_COUNT);
        model.addAttribute("startPage", startPage);
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("freeCategory",freeCategory);
 
	}
	
	/**
	 * 전체검색 관리자
	 **/
	@RequestMapping("/admin/freeBoard_Admin") 
	public void listForAdmin(Model model, @RequestParam(defaultValue = "1") int nowPage, String freeCategory) {
		
        Page<FreeBoard> pageList = freeBoardService.selectByCate(freeCategory, nowPage, PAGE_COUNT);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("pageList", pageList);
        model.addAttribute("blockCount", BLOCK_COUNT);
        model.addAttribute("startPage", startPage);
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("freeCategory",freeCategory);

	}
	
	/**
	 * 내글조회 (마이페이지)
	 **/
	@RequestMapping("/mypage/myFreeboard")
	public String myFreeboard(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Page<FreeBoard> pageList = freeBoardService.selectByUserId(users.getUserId(), nowPage, PAGE_COUNT);
		List<FreeBoard> list = pageList.getContent();
		List<FreeBoardDTO> freelist =new ArrayList<FreeBoardDTO>();
		
		for(FreeBoard f:list) {
			freelist.add(new FreeBoardDTO(f.getFreeId(), f.getUser().getUserId(), f.getFreeCategory(), f.getFreeTitle(),
					f.getFreeContent(), f.getFreeAttach(), f.getFreeReadnum(), f.getFreeRegdate().format(format), f.getFreeUpdate().format(format)));
		}
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		 model.addAttribute("pageList",pageList);
		 model.addAttribute("users",users);
	     model.addAttribute("totalPage",pageList.getTotalPages());
		 model.addAttribute("blockCount", BLOCK_COUNT);
	     model.addAttribute("startPage", startPage);
	     model.addAttribute("nowPage", nowPage);
		 
	     
		 return "mypage/myFreeboard";
        
 
	}
	
	
	
	/**
	 *  페이징처리
	 **/
	/*
	 * @RequestMapping("/board/freeBoard") public void list(Model
	 * model, @RequestParam(defaultValue = "1") int nowPage) {
	 * 
	 * // 페이징 처리 Pageable page = PageRequest.of(nowPage - 1, 10, Direction.DESC,
	 * "freeId"); Page<FreeBoard> list = freeBoardService.getAllFreeBoards(page);
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * int blockCount = 5; int temp = (nowPage - 1) % blockCount; int startPage =
	 * nowPage - temp;
	 * 
	 * model.addAttribute("blockCount", blockCount); model.addAttribute("startPage",
	 * startPage); }
	 */
	
	/**
	  * 글 등록폼
	  **/
	@RequestMapping("/board/freeBoard_Write")
	public void write() {
		
	}
	
	/**
	 * 글 등록
	 **/
	@RequestMapping("/board/freeBoard_Insert")
	public String insert(FreeBoard freeBoard, HttpSession session) {
		System.out.println("첨부파일??"+freeBoard.getFile()+"null값일 regdate 시간"+freeBoard.getFreeRegdate());
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		freeBoard.setUser(users);
		
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/freeBoard/";
		freeBoardService.addFreeBoard(freeBoard, uploadPath);
		System.out.println("=====등록완료하고 다시 목록으로 돌아가기==========");
		return "redirect:/board/freeBoard";
		
	}
	
	/**
	 * 상세보기
	 **/
	@RequestMapping("board/freeBoard_Detail/{freeId}")
	public ModelAndView read(@PathVariable Long freeId) {
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		FreeBoard dbfreeBoard = freeBoardService.getFreeBoard(freeId, true);
		FreeBoardDTO freeBoard = new FreeBoardDTO(dbfreeBoard.getFreeId(), dbfreeBoard.getUser().getUserId(), dbfreeBoard.getFreeCategory(),
				dbfreeBoard.getFreeTitle(), dbfreeBoard.getFreeContent(), dbfreeBoard.getFreeAttach(), dbfreeBoard.getFreeReadnum(), dbfreeBoard.getFreeRegdate().format(format), dbfreeBoard.getFreeUpdate().format(format));
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
    public ModelAndView update(FreeBoard freeboard, HttpSession session) {
    	DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"); 	
    	String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/freeBoard/";
    	FreeBoard dbfreeBoard = freeBoardService.updateFreeBoard(freeboard, uploadPath);
    	FreeBoardDTO freeBoard = new FreeBoardDTO(dbfreeBoard.getFreeId(), dbfreeBoard.getUser().getUserId(), dbfreeBoard.getFreeCategory(),
				dbfreeBoard.getFreeTitle(), dbfreeBoard.getFreeContent(), dbfreeBoard.getFreeAttach(), dbfreeBoard.getFreeReadnum(), dbfreeBoard.getFreeRegdate().format(format), dbfreeBoard.getFreeUpdate().format(format));
    	return new ModelAndView("board/freeBoard_Detail", "freeBoard", freeBoard);
    }
	
	/**
	 * 삭제하기
	 **/
    @RequestMapping("/board/freeBoard_delete")
	 public String delete(Long freeId) {
		 freeBoardService.deleteFreeBoard(freeId);		 
		 return "redirect:/board/freeBoard"; 
	 
	 }
	
    /**
	* 삭제하기(마이페이지)
	 **/
    @RequestMapping("/mypage/freeBoard_delete/{freeId}")
	 public String myDelete(@PathVariable Long freeId) {
   	 freeBoardService.deleteFreeBoard(freeId);		 
		 
		 return "redirect:/mypage/myFreeboard"; 
	 
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
