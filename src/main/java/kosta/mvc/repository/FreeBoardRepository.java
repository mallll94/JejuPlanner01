package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.FreeBoard;

public interface FreeBoardRepository extends JpaRepository<FreeBoard, Long> {


	/**
	 * 소통게시판 등록하기
	 */
	public void insertFreeBoard(FreeBoard freeBoard);
	
	/**
	 * 소통게시판 수정하기
	 */
	public void updateFreeBoard(FreeBoard freeBoard);
	
	/**
	 * 소통게시판 전체 조회하기
	 */
	public List<FreeBoard> selectAllFreeBoards();
	
	/**
	 * 소통게시판 조회하기
	 */
	public FreeBoard selectFreeBoard(Long freeId);
	
	/**
	 * 소통게시판 삭제하기
	 */
	//public void deleteFreeBoard(Long freeId);

}
