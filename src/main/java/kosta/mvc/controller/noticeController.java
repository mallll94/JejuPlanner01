package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Notice;
import kosta.mvc.service.NoticeService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class noticeController {
	
	
	private final NoticeService noticeService;
    
	/**
	 * 전체검색
	 **/
	@RequestMapping("/notice")
	public void list(Model model) {
		
		List<Notice> list = noticeService.selectAll();

		model.addAttribute("list", list);
	}
	
	/**
	 * 글 등록폼 
	 **/
	@RequestMapping("/write")
	public void write( ) {}
	
	/**
	 * 글 등록
	 **/
	@RequestMapping("/insert")
	public String insert(Notice notice) {
		noticeService.insert(notice);
		
		return "redirect:/board/list";
	}
	  
	
	
	
	
}
