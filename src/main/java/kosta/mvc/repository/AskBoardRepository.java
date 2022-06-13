package kosta.mvc.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.AskBoard;
import kosta.mvc.domain.PlanBoard;

import java.util.List;
public interface AskBoardRepository extends JpaRepository<AskBoard, Long> , QuerydslPredicateExecutor<AskBoard> {
	
	




}

