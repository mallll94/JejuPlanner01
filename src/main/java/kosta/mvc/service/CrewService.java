package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.CrewBoard;

public interface CrewService {

	/**
	 * 동행구하기 게시판 목록 조회
	 * */
	List<CrewBoard> selectAll();
	
	/**
	 * 동행구하기 게시판 Page 처리
	 **/
	Page<CrewBoard> selectAll(Pageable pageable);
	
	/**
	 * 동행구하기 게시판 상세 조회
	 * */
	CrewBoard selectById(Long crewId);
	
	/**
	 * 동행구하기 게시판 등록
	 * */
	void insertCrewBoard(CrewBoard crewBoard);
	
	/**
	 * 동행 구하기 완료 여부
	 * @return 
	 **/
	void changeState(Long crewId,String btnradio);
	
	/**
	 * 동행구하기 게시판 수정
	 * @return 
	 * */
	CrewBoard updateCrewBoard(CrewBoard crewBoard);
	
	/**
	 * 동행구하기 게시판 삭제
	 * */
	void deleteCrewBoard(Long crewId);
	
	/**
	 * 마이페이지 조회
	 **/
	public Page<CrewBoard> selectByUserId(String userId, int nowpage, int pageCount);
}
