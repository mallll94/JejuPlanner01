package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kosta.mvc.domain.Notice;
import kosta.mvc.service.NoticeService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class noticeController {
	
	
	private final NoticeService noticeService;
	
    
	/**
	 * 전체검색
	 **/
	@RequestMapping("/board/notice")
	public void list(Model model) {
		
		List<Notice> list = noticeService.selectAll();

		model.addAttribute("list", list);
	}
	
	/**
	 * 전체검색
	 **/
	@RequestMapping("/admin/notice_Admin")
	public void listForAdimin(Model model) {
		
		List<Notice> list = noticeService.selectAll();

		model.addAttribute("list", list);
	}
	

	/**
	  * 글 등록폼
	  * */
	 @RequestMapping("/admin/notice_Write")
	 public void write() {
		 
		 
	 }
	
	/**
	 * 글 등록
	 **/
	@RequestMapping(value = "/admin/insert", method = RequestMethod.POST)
	public String insert(Notice notice, HttpSession session) {
		
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/notice/";
		noticeService.insert(notice, uploadPath);
		

		
		return "redirect:/admin/notice_Admin";
	}
	  
	
	
	
	
}
