package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.PlanReply;
import kosta.mvc.service.PlanReplyService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PlanReplyController {
	
	private final PlanReplyService planReplyService;
	
	/**댓글 조회*/
	@RequestMapping("/reply/PlanReply_Write")
	public void planReplyList(Model model) {
		List<PlanReply> list = planReplyService.getPlanRepliesByPlanBoardId(null);
		
		System.out.println("planreply");
		
		model.addAttribute("list",list);
	}
	
	/**댓글 등록폼*/
	@RequestMapping("/reply/PlanReply_Write")
	public String write(Long pboardReplyId, Model model) {
		model.addAttribute("pboardReplyId", pboardReplyId);
		
		return "reply/PlanReply_Write";
	}
	
	/**댓글 등록*/
	@RequestMapping("/reply/planinsert")
	public String insert(PlanReply planReply, Long pboardId) {
		planReplyService.insert(pboardId, planReply);
		
		return "redirect:/reply/PlanReply_Write";
	}
	
	/**댓글 수정폼*/
	@RequestMapping("/reply/PlanReply_updateForm")
	public ModelAndView updateForm(Long pboardReplyId) {
		PlanReply planReply = planReplyService.update(pboardReplyId);
		
		return new ModelAndView(null, null)
	}
	
	/**댓글 수정*/

	/**댓글 삭제*/
	@RequestMapping("/reply/delete/{pboardReplyId}")
	public String delete(@PathVariable Long pboardReplyId) {
		planReplyService.delete(pboardReplyId);
		
		System.out.println("reply delete");
		
		return "redirect:/reply/PlanReply_Writer";
	}
	 

}
