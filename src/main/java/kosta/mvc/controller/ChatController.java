package kosta.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.ChatBoard;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.ChatDTO;
import kosta.mvc.repository.ChatBoardRepository;
import kosta.mvc.service.ChatService;
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
	
	private final ChatService chatService;

	
	
	@RequestMapping("/list")
	public String chat() {
		
		return "chat/chat_List";
		
	}
	
	@RequestMapping("/{url}")
	public void test() {

	}
	
	
	
	
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public List<ChatDTO> selectAll(){

		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<ChatBoard> list =chatService.selectAll(users);
		
		List<ChatDTO> resultList = new ArrayList<ChatDTO>();
		for(ChatBoard x : list) {
			System.out.println(x);
			ChatDTO dto = new ChatDTO(x.getChatId(), x.getCrewboard(), users.getUserId(),x.getReceiverUser().getUserId() , x.getChatRoom(),
					x.getChatSend(), x.getChatRead(), x.getChatContent(), x.getChatCheck());
			resultList.add(dto);
		}
		
		return resultList;
	}

	@RequestMapping("/chatAll")
	@ResponseBody
	public Map<String, Object> chatAll(int chatRoom){
		Map<String, Object> result = new HashMap<String, Object>();
		//Map<String, List<ChatDTO>> result = new HashMap<String, List<ChatDTO>>();
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//Map<String, List<ChatBoard>> map =chatService.selectById(chatRoom,users);
		List<ChatBoard> list=chatService.selectById(chatRoom,users);
		List<ChatDTO> sendList = new ArrayList<ChatDTO>();	
		//List<ChatDTO> receList = new ArrayList<ChatDTO>();
		for(ChatBoard x : list) {
			ChatDTO dto = new ChatDTO(x.getChatId(), x.getCrewboard(), x.getReceiverUser().getUserId(), x.getSenderUser().getUserId(), x.getChatRoom(), x.getChatSend(), x.getChatRead(), x.getChatContent(), x.getChatCheck());	
			sendList.add(dto);
		}
		/*
		for(int i=0; i < map.get("send").size();i++) {
			
			ChatDTO dto = new ChatDTO(map.get("send").get(i).getChatId(), map.get("send").get(i).getCrewboard(), null,map.get("send").get(i).getReceiverUser().getUserId() , map.get("send").get(i).getChatRoom(),
					map.get("send").get(i).getChatSend(), map.get("send").get(i).getChatRead(), map.get("send").get(i).getChatContent(), map.get("send").get(i).getChatCheck());
			
			sendList.add(dto);
		}
		
		for(int i=0; i < map.get("receive").size();i++) {
			
			ChatDTO dto = new ChatDTO(map.get("receive").get(i).getChatId(), map.get("receive").get(i).getCrewboard(), null, map.get("receive").get(i).getReceiverUser().getUserId() , map.get("receive").get(i).getChatRoom(),
					map.get("receive").get(i).getChatSend(), map.get("receive").get(i).getChatRead(), map.get("receive").get(i).getChatContent() , map.get("receive").get(i).getChatCheck());
			
			receList.add(dto);
		}
		result.put("send", sendList);
		result.put("receive", receList);
		*/
		result.put("msg", sendList);
		result.put("userId", users.getUserId());
		return result;
	}
	
	
	@RequestMapping("/send")
	@ResponseBody
	public String send(String msg,String receId) {
		System.out.println("들어오긴해??");
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		chatService.sendMessage(msg,users.getUserId(),receId);
		System.out.println("fdfwef 여기까지 가능?");
		return "dd";
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