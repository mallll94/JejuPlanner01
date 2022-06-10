package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.CrewReply;

public interface CrewReplyService {
	
	/**동행구하기 게시글의 댓글 조회*/
	public List<CrewReply> getCrewRepliesByCrewBoardId(Long crewId);

	/**댓글 등록*/
	void insert(Long crewId, CrewReply crewReply);
	
	/**댓글 삭제*/
	void delete(Long crewReplyId);
}
