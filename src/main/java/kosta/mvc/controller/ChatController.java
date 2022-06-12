package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.service.GoodsService;
import lombok.RequiredArgsConstructor;

//import org.springframework.messaging.handler.annotation.MessageMapping;
//import org.springframework.messaging.handler.annotation.Payload;
//import org.springframework.messaging.handler.annotation.SendTo;
//import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import kosta.mvc.domain.ChatBoard;
//import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {
	

	
	
	@RequestMapping("/list")
	public String chat() {
		
		return "chat/chat_List";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	@MessageMapping("/chat.register")
	@SendTo("/queue/public")
	public ChatBoard register(@Payload ChatBoard chat,
			SimpMessageHeaderAccessor headerAccessor) {
		 
		//누가 보냈는지 정보 담기
		headerAccessor.getSessionAttributes().put("userId", chat.getSender());
		
		return chat;
		
	}
	
	@MessageMapping("/chat.send")
	@SendTo("/queue/public")
	public ChatBoard sendMessage(@Payload ChatBoard chat) {
		// 채팅방 번호 꺼내서
		// DB SAVE
		// ~~~.("/topic/" + boardId + "/" + chatRoomId, chat);
		return chat;
	}
		
	*/
	
}