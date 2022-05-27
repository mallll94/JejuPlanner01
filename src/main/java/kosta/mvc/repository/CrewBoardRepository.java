package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.CrewBoard;

public interface CrewBoardRepository extends JpaRepository<CrewBoard, Long> {

}
