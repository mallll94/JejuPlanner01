package kosta.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.FreeBoard;
import kosta.mvc.domain.FreeReply;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.FreeReplyDTO;
import kosta.mvc.service.FreeBoardService;
import kosta.mvc.service.FreeReplyService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FreeReplyController {
	
	private final FreeBoardService freeBoardService;
	
	private final FreeReplyService freeReplyService;
	
	private final UserService userService;

	/**
	 * 댓글 조회
	 **/
	@RequestMapping("/reply/freeBoard_Detail")
	@ResponseBody
	public List<FreeReplyDTO> freeReplyList(String freeId) {
		
		FreeBoard freeBoard = freeBoardService.getFreeBoard(Long.valueOf(freeId), true);
		
		List<FreeReply> dblist = freeBoard.getFreeReply();
		
		List<FreeReplyDTO> list = new ArrayList<FreeReplyDTO>();
		for(FreeReply x : dblist) {
			list.add(new FreeReplyDTO(x.getFreeReplyId(), x.getFreeBoard().getFreeId(), 
					 x.getUser().getUserId(), x.getFreeReplyContent())); //이부분
		}
				
		return list;
		
	}
	
	/**
	 * 댓글 등록
	 **/
	@RequestMapping("/reply/freeBoard_Insert")
	@ResponseBody
	public void insert(String replyContent, String freeId) {
		
		//FreeBoard freeBoard = freeBoardService.getFreeBoard(Long.valueOf(freeId), false);
	
		//Users users = userService.selectById("ddd"); 
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		FreeReply reply = new FreeReply(null, null, users, replyContent, null); //물어보기
		
		freeReplyService.addFreeReply(Long.valueOf(freeId), reply);
			
	}
	
	
	
	/**
	 * 댓글 삭제
	 **/
	@RequestMapping("/reply/freeBoard_Delete")
	@ResponseBody
	public void delete(String freeReplyId) {
		freeReplyService.deleteFreeReply(Long.valueOf(freeReplyId));
			
	}
	
}
