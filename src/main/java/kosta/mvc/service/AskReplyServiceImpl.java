package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.AskBoard;
import kosta.mvc.domain.AskReply;
import kosta.mvc.repository.AskBoardRepository;
import kosta.mvc.repository.AskReplyRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AskReplyServiceImpl implements AskReplyService {

	private final AskReplyRepository askReplyRep;
	
	private final AskBoardRepository askBoardRep;
	
	@Override
	public List<AskReply> getAskRepliesByAskBoardId(Long askId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void addAskReply(Long askId, AskReply askReply) {
		AskBoard ask = askBoardRep.findById(askId)
				.orElseThrow(() -> new RuntimeException("글을 찾을 수 없습니다."));
		
		askReply.setAskBoard(ask);
		askReplyRep.save(askReply);
	}

	@Override
	public void updateAskReply(AskReply askReply) {
		
      
	}
	

	@Override
	public void deleteAskReply(Long askReplyId) {
		askReplyRep.deleteById(askReplyId);

	}

}
