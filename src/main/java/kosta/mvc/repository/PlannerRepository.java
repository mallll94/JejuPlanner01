package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.Planner;

public interface PlannerRepository extends JpaRepository<Planner, Long> , QuerydslPredicateExecutor<Planner>{

	/**userID에 해당하는 레코드 검색*/
	@Query("select p from Planner p where p.user.userId =?1 order by p.plannerStart asc")
	List<Planner> selectByUserID(String userId);
	
}
