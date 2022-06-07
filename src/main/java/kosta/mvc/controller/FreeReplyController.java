package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public 
	
}
