package kosta.mvc.repository;




import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Likes;


@Transactional
public interface LikesRepository extends JpaRepository<Likes, Long>  {
	
	@Query("select l from Likes l where l.user.userId = ?1 and l.planBoard.pboardId = ?2")
	Likes findlikesByUserIdAndPboardId(String userId , Long pboardId);
	
	
	

}
