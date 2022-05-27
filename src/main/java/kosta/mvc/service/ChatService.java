package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.ChatBoard;

public interface ChatService {

	/**
	 * 채팅 방 목록 가져오기 
	 * */
	List<ChatBoard> selectAll(ChatBoard chatBoard);
	
	/**
	 * room별 채팅 내용 가져오기
	 * */
	List<ChatBoard> selectById(ChatBoard chatBoard);
	
	/**
	 * 메세지 list에서 메세지 보낸다.
	 * */
	int sendMessage(ChatBoard chatBoard);
}
