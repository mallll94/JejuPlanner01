package kosta.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.PlanBoard;
import kosta.mvc.domain.PlanReply;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.PlanReplyDTO;
import kosta.mvc.service.PlanBoardService;
import kosta.mvc.service.PlanReplyService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PlanReplyController {
	
	private final PlanReplyService planReplyService;
	private final PlanBoardService planBoardService;
	private final UserService userService;
	
	/**댓글 조회*/
	@RequestMapping("/reply/Planboard_Detail")
	@ResponseBody
	public List<PlanReplyDTO> planReplyList(String pboardId) {
		System.out.println("pboardId" + pboardId);
		
	    PlanBoard planboard = planBoardService.selectById(Long.valueOf(pboardId));
		
		List<PlanReply> dblist = planboard.getPlanReply();
		
		System.out.println(dblist.size());
		
		List<PlanReplyDTO> list = new ArrayList<PlanReplyDTO>();
		for(PlanReply x : dblist) {
			list.add(new PlanReplyDTO(x.getPboardReplyId(), x.getPlanBoard().getPboardId(), 
					x.getUser().getUserId(), x.getPboardReplyContent()));
		}
		
		System.out.println("planreply");
		
		return list;
	}
	
	
	/**댓글 등록*/
	@RequestMapping("/reply/planinsert")
	@ResponseBody
	public void insert(String replyContent, String pboardId) {
		System.out.println("insert 되나?");
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
	    PlanReply reply = new PlanReply(null, null, users, replyContent, null);

		planReplyService.insert(Long.valueOf(pboardId), reply);
		
		System.out.println("insertreply");
		
			
	}
	

	/**댓글 삭제*/
	@RequestMapping("/reply/delete")
	@ResponseBody
	public void delete(String pboardReplyId) {
		planReplyService.delete(Long.valueOf(pboardReplyId));
		
		System.out.println("reply delete");
				
	}
	 
}
