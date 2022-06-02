package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.loader.entity.NaturalIdEntityJoinWalker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.FreeBoard;
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
	
	/**
	 * 상세보기
	 **/
	@RequestMapping("admin/notice_Detail/{noticeId}")
	public ModelAndView read(@PathVariable Long noticeId) {
		Notice notice = noticeService.selectById(noticeId); 
		return new ModelAndView("admin/notice_Detail","notice", notice);
	}
	
	
	/**
	 * 수정폼
	 **/
	 @RequestMapping("admin/updateForm")
	 public ModelAndView updateForm(Long noticeId) {
		Notice notice = noticeService.selectById(noticeId);
		 return new ModelAndView("admin/notice_Update","notice", notice);
	 }
	 
	 /**
	  * 수정하기
	  **/
	 @RequestMapping(value = "admin/update", method = RequestMethod.POST)
	 public String update(Notice notice, HttpSession session) {
		 
		 String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/notice/";
		 Notice dbNotice = noticeService.update(notice, uploadPath);
		 
		 return "redirect:/admin/notice_Detail/" + dbNotice.getNoticeId();
	 }
	 
	 
	 /**
	  * 삭제하기
	  **/
	 @RequestMapping("/delete")
	 public String delete(Long noticeId) {
	   noticeService.delete(noticeId);
	   
	   return "redirect:/admin/notice_Admin";
	 }
	
}
