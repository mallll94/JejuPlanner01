package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.TimeOrderLine;

public interface TimeOrderLineRepository extends JpaRepository<TimeOrderLine, Long> {

}
