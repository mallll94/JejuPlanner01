package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.ChatBoard;
import kosta.mvc.repository.ChatBoardRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {
	
	private final ChatBoardRepository chatBoardRep;
	

	@Override
	public List<ChatBoard> selectAll(ChatBoard chatBoard) {
		
		return chatBoardRep.findAll();
	}

	@Override
	public List<ChatBoard> selectById(ChatBoard chatBoard) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int sendMessage(ChatBoard chatBoard) {
		// TODO Auto-generated method stub
		return 0;
	}

}
