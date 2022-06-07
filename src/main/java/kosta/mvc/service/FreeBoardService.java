package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.CrewBoard;
import kosta.mvc.domain.FreeBoard;

public interface FreeBoardService {

	/**
	 * 소통게시판 등록하기
	 */
	public void addFreeBoard(FreeBoard freeBoard, String uploadPath);
	
	/**
	 * 소통게시판 수정하기
	 */
	FreeBoard updateFreeBoard(FreeBoard freeBoard, String uploadPath);
	
	/**
	 * 소통게시판 전체 조회하기
	 */
	public List<FreeBoard> getAllFreeBoards();
	
	/**
	 * 소통게시판 조회하기
	 */
	public FreeBoard getFreeBoard(Long freeBoardId, boolean state);
	
	/**
	 * 소통게시판 삭제하기
	 */
	public void deleteFreeBoard(Long freeBoardId);

	/**
	 * 소통게시판 Page 처리
	 **/
	Page<FreeBoard> getAllFreeBoards(Pageable pageable);


}
