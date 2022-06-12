package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.ChatBoard;

public interface ChatBoardRepository extends JpaRepository<ChatBoard, Long>, QuerydslPredicateExecutor<ChatBoard> {

}
