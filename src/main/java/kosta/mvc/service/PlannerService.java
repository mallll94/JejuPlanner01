package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.dto.PlannerPlaceDTO;


public interface PlannerService {

	/**
	 * 플래너 목록 전체 검색
	 * */
	List<Planner> selectAll(String userId);
	
	/**
	 * 플래너 상세 검색
	 * */
	//PlannerDTO selectBy(Long plannerId);
	Planner selectBy(Long plannerId);
	
	/**
	 * 일자별 플래너 검색
	 * */
	Planner selectByDay(Long plannerId,int day);
	
	/**카테고리별 플래너 일정 검색*/
	List<PlannerPlaceDTO> selectPlaceByPlanner (List<PlannerPlace> list);
	
	
	/**
	 * 플래너 생성
	 * */
	void insertPlan(Planner planner);
	
	/**
	 * 플래너 일정 등록
	 * */
	void insertPlanPlace(PlannerPlace PlannerPlace);
	
	/**
	 * 플래너 수정 - 사용자 플래너 (인원 ,타입 , 플래너 이름 수정)
	 * */
	void updatePlan(Planner planner);
	
	/**
	 * 플래너 일정 수정
	 * */
	void updatePlanPlace(PlannerPlace PlannerPlace);
	
	/**
	 * 플래너 일정 삭제
	 * */
	void deletePlanPlace(Long plannerPlaceId);
	
	/**
	 * 플래너 삭제 - 진짜 삭제가 아니고 state를 비활성화 해준다.
	 * */
	void deletePlan(Long plannerId);

	/**
	 * 공유하기
	 * */
	void PlannerShareBoard(Long placeId);
}
