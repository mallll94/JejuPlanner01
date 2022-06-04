package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.AskReply;
import kosta.mvc.domain.PlanReply;
import kosta.mvc.repository.PlanReplyRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class PlanReplyServiceImpl implements PlanReplyService {
	
	private final PlanReplyRepository planReplyRep;
	
	@Override
	public List<PlanReply> getPlanRepliesByPlanBoardId(Long pboardId) {
		// TODO Auto-generated method stub
		return null;
	}
	

	@Override
	public void insert(Long pboardId, PlanReply planReply) {
		// TODO Auto-generated method stub

	}
	
	
	@Override
	public void update(PlanReply planReply) {
		// TODO Auto-generated method stub
		
	}
	

	@Override
	public void delete(Long pboardReplyId) {
		// TODO Auto-generated method stub

	}

}
