package kosta.mvc.service;

import java.util.List;
import java.util.Map;

import kosta.mvc.domain.ChatBoard;
import kosta.mvc.domain.Users;

public interface ChatService {

	/**
	 * 채팅 방 목록 가져오기 
	 * */
	List<ChatBoard> selectAll(Users user);
	
	/**
	 * room별 채팅 내용 가져오기
	 * */
	List<ChatBoard> selectById(int chatRoom, Users users);
	
	/**
	 * 메세지 list에서 메세지 보낸다.
	 * */
	void sendMessage(String msg,String userId,String receId,int chatRoom);
	
	/**
	 * 읽음 전환 
	 * */
	void changeType (int chatRoom);
}
