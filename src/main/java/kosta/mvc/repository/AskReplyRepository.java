package kosta.mvc.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.AskReply;


public interface AskReplyRepository extends JpaRepository<AskReply, Long> {
	
	/**
	 * 1:1문의게시판 댓글 등록
	 */
	public void insertAskReply(AskReply askReply);
	
	/**
	 * 1:1문의게시판 댓글 수정
	 */
	public void updateAskReply(AskReply askReply);
	
	/**
	 * 1:1문의게시판 게시글의 댓글 조회하기
	 */
	public List<AskReply> selectAskRepliesByAskBoardId(Long askId);
	
	/**
	 * 1:1문의게시판 댓글 삭제
	 */
	//public void deleteAskReply(Long askReplyId);
}


