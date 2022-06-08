package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.FreeBoard;
import kosta.mvc.domain.FreeReply;
import kosta.mvc.repository.FreeBoardRepository;
import kosta.mvc.repository.FreeReplyRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class FreeReplyServiceImpl implements FreeReplyService {
    
	private final FreeReplyRepository freeReplyRep;
	
	private final FreeBoardRepository freeBoardRep;
	
	/**
	 * 전체 조회(필요한가?)
	 **/
	@Override
	public List<FreeReply> getFreeRepliesByFreeBoardId(Long freeId) {
		

		return null;
	}
    
	/**
	 * 등록
	 **/
	@Override
	public void addFreeReply(Long freeId, FreeReply freeReply) {
		FreeBoard freeBoard = freeBoardRep.findById(freeId)
				.orElseThrow(() -> new RuntimeException("해당하는 글을 찾을수 없습니다."));
		freeReply.setFreeBoard(freeBoard);
		freeReplyRep.save(freeReply);
		
	}

	/**
	 * 삭제
	 **/
	@Override
	public void deleteFreeReply(Long freeReplyId) {
       freeReplyRep.deleteById(freeReplyId);

	}

}
