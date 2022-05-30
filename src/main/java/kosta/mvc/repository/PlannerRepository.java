package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Planner;

public interface PlannerRepository extends JpaRepository<Planner, Long> {

	/**userID에 해당하는 레코드 검색*/
	@Query("select p from Planner p where p.user.userId =?1")
	List<Planner> selectByUserID(String userId);
}
