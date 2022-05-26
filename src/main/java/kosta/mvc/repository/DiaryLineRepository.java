package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.DiaryLine;

public interface DiaryLineRepository extends JpaRepository<DiaryLine, Long> {

}
