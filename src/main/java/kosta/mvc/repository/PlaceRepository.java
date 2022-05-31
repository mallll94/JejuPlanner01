package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Place;

public interface PlaceRepository extends JpaRepository<Place, Long>, QuerydslPredicateExecutor<Place>  {

	@Query("select p from Place p")//Sort sort,
	List<Place> findAllSort(Pageable pageable);
	
	@Query("select p from Place p where p.placeCategory=?1")//,Sort sort
	List<Place> findbyPlaceCategory(String placeCategory,Pageable pageable);
	
	/**
	 * 장소/숙박 선택시
	 * 가나다 순
	 * */
	List<Place> findbyPlaceCategoryOrderByPlaceNameAsc(String placeCategory,Pageable pageable);
	/**
	 * 장소/숙박 선택시
	 * 인기순
	 * */
	List<Place> findbyPlaceCategoryOrderByPlaceSaveDesc(String placeCategory,Pageable pageable);
	/**
	 * 장소/숙박 선택시
	 * 등록순
	 * */
	List<Place> findbyPlaceCategoryOrderByPlaceIdDesc(String placeCategory,Pageable pageable);
	
	
}
