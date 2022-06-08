package kosta.mvc.controller;

import java.util.ArrayList;
import java.util.List;

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
	public List<FreeReplyDTO> freeReplyList(String freeBoardId) {
		
		FreeBoard freeBoard = freeBoardService.getFreeBoard(Long.valueOf(freeBoardId), true);
		
		List<FreeReply> dblist = freeBoard.getFreeReply();
		
		List<FreeReplyDTO> list = new ArrayList<FreeReplyDTO>();
		for(FreeReply x : dblist) {
			list.add(new FreeReplyDTO(x.getFreeReplyId(), x.getFreeBoard().getFreeId(), 
					 x.getUser().getUserId(), x.getFreeReplyContent()));
		}
				
		return list;
		
	}
	
	/**
	 * 댓글 등록
	 **/
	@RequestMapping("/reply/freeBoard_Insert")
	@ResponseBody
	public FreeReply insert(String freeReplyContent, String freeBoardId) {
		
		FreeBoard freeBoard = freeBoardService.getFreeBoard(Long.valueOf(freeBoardId), true);
		Users user = userService.selectById("ddd"); 
		
		FreeReply reply = new FreeReply(null, freeBoard, user, freeReplyContent, null); //물어보기
		
		freeReplyService.addFreeReply(freeBoard.getFreeId(), reply);
		
		return reply;
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
