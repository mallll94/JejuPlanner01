package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.AskReply;
import kosta.mvc.repository.AskReplyRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AskReplyServiceImpl implements AskReplyService {

	private final AskReplyRepository askReplyRep;
	
	@Override
	public List<AskReply> getAskRepliesByAskBoardId(Long askId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void addAskReply(AskReply askReply) {
		askReplyRep.save(askReply);

	}

	@Override
	public void updateAskReply(AskReply askReply) {
		AskReply dbReply = askReplyRep.findById(askReply.getAskReplyId()).orElse(null);
      
	}
	

	@Override
	public void deleteAskReply(Long askReplyId) {
		askReplyRep.deleteById(askReplyId);

	}

}
