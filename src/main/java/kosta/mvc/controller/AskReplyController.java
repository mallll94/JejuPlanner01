package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.AskReply;
import kosta.mvc.service.AskReplyService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AskReplyController {
	
	private final AskReplyService askReplyService;
	

	
	/**댓글 등록*/
	@RequestMapping("/reply/insert")
	public String insert(AskReply askReply , Long askId) {
		
		askReplyService.addAskReply(askId, askReply);
		
	    return "redirect:/admin/AskDetail_Admin/" + askId;
	}
	
	
	/**댓글 삭제*/
	@RequestMapping("/reply/delete/{askReplyId}/{askId}")
	public String delete(@PathVariable Long askReplyId, @PathVariable Long askId) {
		
		askReplyService.deleteAskReply(askReplyId);
		
		System.out.println("reply delete");
		
		return "redirect:/admin/AskDetail_Admin/" + askId;
	}

}
