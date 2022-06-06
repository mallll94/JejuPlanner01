package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import kosta.mvc.domain.DiaryLine;
import kosta.mvc.domain.Place;

public interface DiaryLineRepository extends JpaRepository<DiaryLine, Long>, QuerydslPredicateExecutor<DiaryLine>  {
	
	@Query("SELECT dl " + 
			"FROM DiaryLine dl " +
			"JOIN FETCH dl.plannerPlace pp " +
			"JOIN FETCH pp.place p " +
			"WHERE dl.diary.id = :diaryId " +
			"ORDER BY pp.plannerPlaceDate ASC")
	List<DiaryLine> findAllByDiary(@Param("diaryId") Long diaryId);

}
