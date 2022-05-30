package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Place;

public interface PlaceService {

	/**
	 * 장소 전체 목록 조회하기
	 * */
	List<Place> selectAll();
	
	/**
	 * 장소 상세 정보 조회하기
	 * */
	Place selectById(Long placeId);
	/**
	 * 장소 필터 별 정보 조회하기
	 * */
	List<Place> selectByCata(String cataNo, String placeCategory);
	
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
}
