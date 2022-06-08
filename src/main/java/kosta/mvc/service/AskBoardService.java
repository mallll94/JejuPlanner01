package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.AskBoard;

public interface AskBoardService {
	
	
	/**등록하기*/
	public void addAskBoard(AskBoard askBoard, String uploadpath);
	
	/**전체검색 - page처리*/
	Page<AskBoard> getAllAskBoards(Pageable pageable);
	
	
	/**
	 * 1:1문의 전체 조회하기
	 */
	public List<AskBoard> getAllAskBoards();
	
	/**
	 * 1:1문의 조회하기 (askBoardId를 이용해)
	 */
	public AskBoard getAskBoard(Long askId);
	
	
	/**
	 * 1:1문의 삭제하기 (askBoardId를 이용해)
	 */
	public void deleteAskBoard(Long askId);




	


	
}
