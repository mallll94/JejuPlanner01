package kosta.mvc.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.FreeBoard;
import kosta.mvc.domain.Users;

public interface FreeBoardRepository
		extends JpaRepository<FreeBoard, Long> , QuerydslPredicateExecutor<FreeBoard>  {
	
	/**
	 *  조회수 증가하는 메소드 
	 **/
    
	@Query("update FreeBoard b set b.freeReadnum = b.freeReadnum + 1 where b.freeId=?1")
	@Modifying 
	void updateReadNum(Long freeId);
	
	Page<FreeBoard> findAllByUser(Users user, Pageable page);


}
