package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.AskBoard;
import kosta.mvc.domain.AskReply;
import kosta.mvc.service.AskReplyService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AskReplyController {
	
	private final AskReplyService askReplyService;
	
	/**댓글 조회 - board*/
	@RequestMapping("/board/Ask_Detail")
	public void askReplyList(Model model) {
		
		List<AskReply> list = askReplyService.getAskRepliesByAskBoardId(null);
		
		//System.out.println("replylist" + list.size());
		
	    model.addAttribute("list",list);
	}
	
		
	/**댓글 폼*/
	@RequestMapping("/reply/AskReply_Write")
	public String write(Long askId, Model model) {
		model.addAttribute("askId", askId);
		
		return "reply/AskReply_Write";
	}
	
	
	/**댓글 등록*/
	@RequestMapping("/reply/insert")
	public String insert(AskReply askReply , Long askId) {
		
		askReplyService.addAskReply(askId, askReply);
		
	    return "redirect:/board/Ask_Detail/" + askId;
	}
	
	
	
	/**댓글 삭제*/
	@RequestMapping("/reply/delete/{askReplyId}/{askId}")
	public String delete(@PathVariable Long askReplyId, @PathVariable Long askId) {
		
		askReplyService.deleteAskReply(askReplyId);
		
		System.out.println("reply delete");
		
		return "redirect:/board/Ask_Detail/" + askId + "?flag=1";
	}

}
