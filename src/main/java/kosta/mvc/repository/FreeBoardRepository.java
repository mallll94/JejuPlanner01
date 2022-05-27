package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.FreeBoard;

public interface FreeBoardRepository extends JpaRepository<FreeBoard, Long> {

	

}
