package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Notice;

public interface NotiecRepository extends JpaRepository<Notice, Long> {

}
