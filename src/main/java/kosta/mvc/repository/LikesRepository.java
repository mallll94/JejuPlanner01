package kosta.mvc.repository;


import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Likes;
import kosta.mvc.domain.PlanBoard;
import kosta.mvc.domain.Users;

@Transactional
public interface LikesRepository extends JpaRepository<Likes, Long>  {
	
	//Optional<Likes> findByUsersAndPlanBoard(Users user , PlanBoard planBoard);
	
	@Query("select l from Likes l where l.user.userId = ?1 and l.planBoard.pboardId = ?2")
	Likes findlikesByUserIdAndPboardId(String userId , Long pboardId);
	
	
	

}
