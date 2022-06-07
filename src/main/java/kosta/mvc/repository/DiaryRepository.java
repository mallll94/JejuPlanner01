package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Diary;
import kosta.mvc.domain.Place;

public interface DiaryRepository extends JpaRepository<Diary, Long>, QuerydslPredicateExecutor<Diary>  {

	/**userId에 해당하는 다이어리 검색*/
	@Query("select d from Diary d where d.user.userId= ?1 order by d.diaryId desc")
	List<Diary> findByUserId(String userId);
	
	/**plannerId에 해당하는 다이어리 검색*/
	@Query("select d from Diary d where d.planner.plannerId = ?1")
	Diary findByPlannerId(Long plannerId);
}
