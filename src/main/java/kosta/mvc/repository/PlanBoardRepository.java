package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.PlanBoard;

public interface PlanBoardRepository extends JpaRepository<PlanBoard, Long> {

}
