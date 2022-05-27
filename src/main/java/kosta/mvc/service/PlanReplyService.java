package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.PlanReply;

public interface PlanReplyService {

	/**
	 * 댓글 등록
	 * */
	void insert(PlanReply reply);
	
	/**
	 * 댓글 삭제
	 * */
	void delete(Long pboardReplyId);
}
