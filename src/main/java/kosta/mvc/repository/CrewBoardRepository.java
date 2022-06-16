package kosta.mvc.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.CrewBoard;
import kosta.mvc.domain.Users;

public interface CrewBoardRepository 
      extends JpaRepository<CrewBoard, Long> , QuerydslPredicateExecutor<CrewBoard> { 
	
	Page<CrewBoard> findAllByUser(Users user, Pageable page);

}
