package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.OrderLine;
public interface OrderLineRepository extends JpaRepository<OrderLine, Long> {

}
