package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.AskBoard;

public interface AskBoardService {
	
	/**
	 * 1:1문의 등록하기
	 */
	public void addAskBoard(AskBoard askBoard);
	
	
	/**
	 * 1:1문의 전체 조회하기
	 */
	public List<AskBoard> getAllAskBoards();
	
	/**
	 * 1:1문의 조회하기 (askBoardId를 이용해)
	 */
	public AskBoard getAskBoard(Long askBoardId);
	
	
	/**
	 * 1:1문의 삭제하기 (askBoardId를 이용해)
	 */
	public void deleteAskBoard(Long askBoardId);
}
