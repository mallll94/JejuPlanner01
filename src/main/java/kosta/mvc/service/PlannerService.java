package kosta.mvc.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.dto.DiaryDTO;
import kosta.mvc.dto.DiaryLineDTO;
import kosta.mvc.dto.PlannerPlaceDTO;


public interface PlannerService {

	/**
	 * 플래너 목록 전체 검색
	 * */
	Page<Planner> selectAllByUserIdPageing(Pageable pageable,String userId);
	
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
	List<PlannerPlaceDTO> selectPlaceByPlanner (Long plannerId);
	
	
	/**
	 * 플래너 생성
	 * */
	void insertPlan(Planner planner);
	
	/**
	 * 플래너 일정 등록
	 * */
	void insertPlanPlace(PlannerPlace PlannerPlace);
	
	/**
	 * 플래너 수정 -  플래너 이름 수정
	 * */
	void updatePlan(Planner planner);
	
	/**
	 * 플래너 수정 -  플래너 기간 수정
	 * */
	void updatePlanStartdateAndEnddate(Planner planner);
	
	/**
	 * 플래너 장소별 일정 수정
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
	
	/**
	 * 플래너 type 수정
	 * */
	void plannerTypeUpdate(String type, Long plannerId);
	void plannerCountUpdate(int count, Long plannerId);
	
	/**
	 * 다이어리 수정-타입/인원/제목/사진
	 * */
	void updateDiary(Planner diary);
/**
	 * 다이어리 내용 추가
	 * */
	Planner insertDiaryLine(PlannerPlace diaryLine, String uploadPath);
	
	/**
	 * 다이어리 내용 조회
	 * */
	PlannerPlace selectPPbyPPId(Long plannerplaceId);
	/**
	 * 다이어리 내용 수정
	 * */
	Planner updateDiaryLine(PlannerPlace diaryLine, String uploadPath);
	
	/**
	 * 다이어리 내용 삭제
	 * */
	Planner DeleteDiaryLine(Long diaryLineId);
	
	/**
	 * 다이어리 삭제
	 * */
	void deleteDiary(Long plannerId);
}
