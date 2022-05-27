package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.AskBoard;

public interface AskBoardRepository extends JpaRepository<AskBoard, Long> {

}
