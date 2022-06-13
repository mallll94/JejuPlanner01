package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.Likes;
import kosta.mvc.domain.PlanBoard;
import kosta.mvc.dto.LikesDTO;

public interface PlanBoardService {

	/**
	 * 플래너게시판 목록 조회
	 * */
	List<PlanBoard> selectAll();
	
	/**플래너게시판 페이징처리*/
	Page<PlanBoard> selectAll(Pageable pageable);
	
	
	/**
	 * 플래너게시판 상세 조회
	 * */
	PlanBoard selectById(Long pboardId);
	
	
	/**좋아요 조회*/
	boolean selectByBoardId(Long pboardId , String userId);
	
			
	/**
	 * 플래너게시판 등록
	 * */
	void insertPlanBoard(PlanBoard planBoard, String uploadpath);
	
	
	/**
	 * 플래너게시판 수정
	 * @return 
	 * */
	PlanBoard updatePlanBoard(PlanBoard planBoard, String uploadpath);
	
	/**
	 * 플래너게시판 삭제
	 * */
	void deletePlanBoard(Long pboardId);

	
	/**카테고리별 조회하기*/
	Page<PlanBoard> selectByCate(String pboarCategory, int nowPage, int PageCount);

	/**좋아요*/
	LikesDTO saveLikes(Long pboardId, String userId);
	
	
	/**마이페이지에서 내가 쓴 글 목록 조회*/
	List<PlanBoard> selectByUserId(String userId);

	

	

	
}
