package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Place;

public interface PlaceRepository extends JpaRepository<Place, Long> {

	/*
	List<Place> findByPlaceCategoryOrderByPlaceSaveAsc(String placeCategory);
	
	List<Place> findByPlaceCategoryOrderByPlaceNameAsc(String placeCategory);
	
	List<Place> findByPlaceCategoryOrderByPlaceIdAsc(String placeCategory);
	
	
	
	@Query("select b from Board b order by ")
	List<Place> findOrderByPlaceSaveAsc(String placeCategory);
	
	List<Place> findOrderByPlaceNameAsc(String placeCategory);
	
	List<Place> findOrderByPlaceIdAsc(String placeCategory);
	*/
	@Query("select p from Place p")
	List<Place> findAllSort(Sort sort);
	
	@Query("select p from Place p where p.placeCategory=?1")
	List<Place> findbyPlaceCategory(String placeCategory,Sort sort);
}
