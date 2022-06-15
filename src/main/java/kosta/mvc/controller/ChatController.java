package kosta.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.ChatBoard;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.ChatDTO;
import kosta.mvc.repository.ChatBoardRepository;
import kosta.mvc.service.ChatService;
import kosta.mvc.service.GoodsService;
import lombok.RequiredArgsConstructor;


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
	public Map<String, Object> selectAll(){
		Map<String, Object> map = new HashMap<String, Object>();
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<ChatBoard> list =chatService.selectAll(users);
		
		List<ChatDTO> resultList = new ArrayList<ChatDTO>();
		for(ChatBoard x : list) {
			System.out.println(x);
			ChatDTO dto = new ChatDTO(x.getChatId(), x.getCrewboard(), x.getSenderUser().getUserId(),x.getReceiverUser().getUserId() , x.getChatRoom(),
					x.getChatSend(), x.getChatRead(), x.getChatContent(), x.getChatCheck());
			resultList.add(dto);
		}
		System.out.println(resultList.size()+"지금당장");
		
		map.put("resultList", resultList);
		map.put("loginUser", users);
		return map;
	}

	@RequestMapping("/chatAll")
	@ResponseBody
	public Map<String, Object> chatAll(int chatRoom){
		Map<String, Object> result = new HashMap<String, Object>();
		String recevId = null;
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		chatService.changeType(chatRoom,users);

		List<ChatBoard> list=chatService.selectById(chatRoom,users);
		List<ChatDTO> sendList = new ArrayList<ChatDTO>();
		
		for(ChatBoard x : list) {
			ChatDTO dto = new ChatDTO(x.getChatId(), x.getCrewboard(), x.getReceiverUser().getUserId(), x.getSenderUser().getUserId(), x.getChatRoom(), x.getChatSend(), x.getChatRead(), x.getChatContent(), x.getChatCheck());	
			sendList.add(dto);
			if(!x.getReceiverUser().getUserId().equals(users.getUserId())) {
				recevId =x.getReceiverUser().getUserId();
				System.out.println(recevId);
			}	
		}

		
		result.put("msg", sendList);
		result.put("userId", users.getUserId());
		result.put("receId",recevId);
		return result;
	}
	
	
	@RequestMapping("/send")
	@ResponseBody
	public String send(String msg,String receId,int chatRoom) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String sendId = users.getUserId();		
		chatService.sendMessage(msg,sendId,receId,chatRoom);

		return "ok";
	}
	
	@RequestMapping("/roomInsert")
	public String roomInsert(int chatRoom,String receId) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String sendId = users.getUserId();
		chatService.sendMessage("채팅시작",sendId,receId,chatRoom);
		
		
		return "chat/chat_Room";
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