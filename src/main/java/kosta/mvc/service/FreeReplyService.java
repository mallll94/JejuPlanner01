package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.FreeReply;

public interface FreeReplyService {
	

	/**
	 * 소통게시판 댓글 등록
	 */
	public void addFreeReply(FreeReply freeReply);
	
	/**
	 * 소통게시판 댓글 수정
	 */
	public void updateFreeReply(FreeReply freeReply);
	
	/**
	 * 소통게시판 게시글의 댓글 조회하기
	 */
	public List<FreeReply> getFreeRepliesByFreeBoardId(Long freeBoardId);
	
	/**
	 * 소통게시판 댓글 삭제
	 */
	public void deleteFreeReply(Long freeReplyId);
	
}
