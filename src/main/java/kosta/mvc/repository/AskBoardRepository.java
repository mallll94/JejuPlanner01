package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.AskBoard;

public interface AskBoardRepository extends JpaRepository<AskBoard, Long> {

	/**
	 * 1:1문의 등록하기
	 */
	public void insertAskBoard(AskBoard askBoard);
	
	/**
	 * 1:1문의 수정하기
	 */
	public void updateAskBoard(AskBoard askBoard);
	
	/**
	 * 1:1문의 전체 조회하기
	 */
	public List<AskBoard> selectAllAskBoards();
	
	/**
	 * 1:1문의 조회하기 (askBoardId를 이용해)
	 */
	public AskBoard selectAskBoard(Long askBoardId);
	
	
	/**
	 * 1:1문의 삭제하기 (askBoardId를 이용해)
	 */
	public void deleteAskBoard(Long askBoardId);
}