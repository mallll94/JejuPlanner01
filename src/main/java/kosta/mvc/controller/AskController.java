package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.AskBoard;
import kosta.mvc.service.AskBoardService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AskController {

	private final AskBoardService askBoardService;

	/**전체검색 - board에서*/
	@RequestMapping("/board/AskList") 
	public void askList(Model model) {
		System.out.println("asklist test");

		List<AskBoard> list = askBoardService.getAllAskBoards();

		model.addAttribute("list",list);

	}


	/**전체검색 - admin에서*/
	@RequestMapping("/admin/AskList_Admin")
	public void askListAdmin(Model model) {
		System.out.println("admin test");
		
		List<AskBoard> askList = askBoardService.getAllAskBoards();

		model.addAttribute("askList",askList);
	}

	
	/**글 등록폼*/
	@RequestMapping("/board/AskBoard")
	public void write() {

	}

	
	/**글 등록*/
	@RequestMapping("/board/insert")
	public String insert(AskBoard askBoard) {
		askBoardService.addAskBoard(askBoard);

		return "redirect:/board/AskList";

	}

	
	/**상세보기*/
	@RequestMapping("/board/Ask_Detail/{askBoardId}")
	public ModelAndView read(@PathVariable Long askBoardId) {
		AskBoard askBoard = askBoardService.getAskBoard(askBoardId);
		
		return new ModelAndView("board/Ask_Detail", "askboard", askBoard);
		
	}

	
	/**삭제*/
	@RequestMapping("/Askdelete")
	public String delete(Long askBoardId) {
		askBoardService.deleteAskBoard(askBoardId);

		return "redirect:/board/AskList";
	}


}
