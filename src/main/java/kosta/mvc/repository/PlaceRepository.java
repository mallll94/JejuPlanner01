package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Place;

public interface PlaceRepository extends JpaRepository<Place, Long>, QuerydslPredicateExecutor<Place>  {

	
	
	/**
	 * 장소/숙박 선택시
	 * 가나다 순
	 * */
	//List<Place> findAllbyOrderByPlaceNameAsc(Pageable pageable);
	
	//List<Place> findByPlaceCategoryOrderByPlaceNameAsc(String placeCategory,Pageable pageable);
	
	/**
	 * 장소/숙박 선택시
	 * 인기순
	 * */
	//List<Place> findAllbyOrderByPlaceSaveDesc(Pageable pageable);
	
	//List<Place> findByPlaceCategoryOrderByPlaceSaveDesc(String placeCategory,Pageable pageable);
	/**
	 * 장소/숙박 선택시
	 * 등록순
	 * */
	//List<Place> findAllbyOrderByPlaceIdDesc(Pageable pageable);
	
	//List<Place> findByPlaceCategoryOrderByPlaceIdDesc(String placeCategory,Pageable pageable);
	
	
	
}
