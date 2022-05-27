package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.TimeDeal;

public interface TimeDealRepository extends JpaRepository<TimeDeal, Long> {

}
