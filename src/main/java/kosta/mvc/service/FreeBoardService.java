package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

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
	 * 소통게시판 상세 조회하기
	 */
	public FreeBoard getFreeBoard(Long freeId, boolean state);
	
	/**
	 * 소통게시판 삭제하기
	 */
	public void deleteFreeBoard(Long freeId);

	/**
	 * 소통게시판 Page 처리
	 **/
	Page<FreeBoard> getAllFreeBoards(Pageable pageable);
	
	/**
	 * 카테고리별 조회하기
	 **/
	Page<FreeBoard> selectByCate(String freeCategory, int nowPage, int PageCount);
    
	/**
	 * 마이페이지 조회 
	 **/
    public Page<FreeBoard> selectByUserId(String userId, int nowPage, int PageCount);
    
}
