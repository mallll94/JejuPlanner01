package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.CrewBoard;

public interface CrewService {

	/**
	 * 동행구하기 게시판 목록 조회
	 * */
	List<CrewBoard> selectAll();
	
	/**
	 * 동행구하기 게시판 상세 조회
	 * */
	CrewBoard selectById(Long crewId);
	
	/**
	 * 동행구하기 게시판 등록
	 * */
	void insertCrewBoard(CrewBoard board);
	
	/**
	 * 동행구하기 게시판 수정
	 * */
	void updateCrewBoard(CrewBoard board);
	
	/**
	 * 동행구하기 게시판 삭제
	 * */
	void deleteCrewBoard(Long crewId);
}
