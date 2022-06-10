package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.AskReply;

public interface AskReplyService {

	/**
	 * 1:1문의게시판 댓글 등록
	 */
	public void addAskReply(Long askId, AskReply askReply);
		
	/**
	 * 1:1문의게시판 게시글의 댓글 조회하기
	 */
	public List<AskReply> getAskRepliesByAskBoardId(Long askId);
	
	/**
	 * 1:1문의게시판 댓글 삭제
	 */
	public void deleteAskReply(Long askReplyId);


	




}
