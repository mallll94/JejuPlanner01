package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.AskReply;
import kosta.mvc.domain.PlanReply;

public interface PlanReplyService {
	
	/**
	 * 플래너공유게시판 게시글의 댓글 조회하기
	 * */
	public List<PlanReply> getPlanRepliesByPlanBoardId(Long pboardId);

	/**
	 * 댓글 등록
	 * */
	void insert(Long pboardId, PlanReply planReply);
	
	
	/**
	 * 댓글 삭제
	 * */
	void delete(Long pboardReplyId);

	


}
