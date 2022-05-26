package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Planner;

public interface PlannerRepository extends JpaRepository<Planner, Long> {

}
