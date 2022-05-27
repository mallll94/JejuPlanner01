package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.FreeReply;

public interface FreeReplyRepository extends JpaRepository<FreeReply, Long> {
	
	/**
	 * 소통게시판 댓글 등록
	 */
	public void insertFreeReply(FreeReply freeReply);
	
	/**
	 * 소통게시판 댓글 수정
	 */
	public void updateFreeReply(FreeReply freeReply);
	
	/**
	 * 소통게시판 게시글의 댓글 조회하기
	 */
	public List<FreeReply> selectFreeRepliesByFreeBoardId(Long freeBoardId);
	
	/**
	 * 소통게시판 댓글 삭제
	 */
	public void deleteFreeReply(Long freeReplyId);

}
