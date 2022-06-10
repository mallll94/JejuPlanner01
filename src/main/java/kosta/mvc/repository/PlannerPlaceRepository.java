package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.PlannerPlace;

public interface PlannerPlaceRepository extends JpaRepository<PlannerPlace, Long>, QuerydslPredicateExecutor<PlannerPlace> {

	@Query("SELECT pp "+
			"FROM PlannerPlace pp "+
			"WHERE pp.planner.id = :plannerId "+
			"ORDER BY pp.plannerPlaceDate ASC , pp.insertDate ASC")
	List<PlannerPlace> findAllByPlannerIdByPlannerPlaceDateAsc(Long plannerId);
}
