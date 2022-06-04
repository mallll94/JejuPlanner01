package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.AskReply;
import kosta.mvc.domain.PlanBoard;
import kosta.mvc.domain.PlanReply;
import kosta.mvc.repository.PlanBoardRepository;
import kosta.mvc.repository.PlanReplyRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class PlanReplyServiceImpl implements PlanReplyService {
	
	private final PlanReplyRepository planReplyRep;
	
	private final PlanBoardRepository planBoardRep;
	
	
	@Override
	public List<PlanReply> getPlanRepliesByPlanBoardId(Long pboardId) {
		
		
		return null;
	}
	

	@Override
	public void insert(Long pboardId, PlanReply planReply) {
		PlanBoard board = planBoardRep.findById(pboardId)
				.orElseThrow(()-> new RuntimeException("글을 찾을 수 없습니다."));
		
		System.out.println("serviceimpl");
		
		planReply.setPlanBoard(board);
		planReplyRep.save(planReply);

	}
	

	@Override
	public void delete(Long pboardReplyId) {
		planReplyRep.deleteById(pboardReplyId);

	}

}
