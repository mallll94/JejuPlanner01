package kosta.mvc.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.dto.PlaceDTO;

public interface PlaceService {

	/**
	 * 장소 전체 목록 조회하기
	 * */
	List<Place> selectAll();
	
	Page<Place> selectAll(int nowPage,int PAGE_COUNT);
	
	/**
	 * 장소 상세 정보 조회하기(id)
	 * */
	Place selectById(Long placeId);
	
	/**
	 * 장소 상세 정보 조회하기(name)
	 * */
	Optional<Place> selectByName(String placeName);
	/**
	 * 장소 필터 별 정보 조회하기
	 * */
	Page<Place> selectByCata(String cataNo, String placeCategory,int nowPage,int PageCount);
	
	/**
	 * 장소 등록하기
	 * */
	void insertPlace(Place place);
	
	/**
	 * 장소 수정하기
	 * */
	void updatePlace(Place place);
	
	/**
	 * 장소 삭제하기
	 * */
	void deletePlace(Long placeId);
	
	/**
	 * 플래너 장소 list 목록 조회하기
	 * */
	List<PlaceDTO> selectByPlanner(List<PlannerPlace> list);

	
}
