package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.CrewBoard;
import kosta.mvc.domain.CrewReply;
import kosta.mvc.repository.CrewBoardRepository;
import kosta.mvc.repository.CrewReplyRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class CrewReplyServiceImpl implements CrewReplyService {

	private final CrewReplyRepository crewReplyRep;
	private final CrewBoardRepository crewBoardRep;
	
	
	@Override
	public List<CrewReply> getCrewRepliesByCrewBoardId(Long crewId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Long crewId, CrewReply crewReply) {
		CrewBoard board = crewBoardRep.findById(crewId)
				.orElseThrow(()-> new RuntimeException("글을 찾을 수 없습니다."));

		System.out.println("크루답변");
		crewReply.setCrewBoard(board);
		crewReplyRep.save(crewReply);
	}

	@Override
	public void delete(Long crewReplyId) {
		crewReplyRep.deleteById(crewReplyId);

	}

}
