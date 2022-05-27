package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.ChatBoard;

public interface ChatBoardRepository extends JpaRepository<ChatBoard, Long> {

}
