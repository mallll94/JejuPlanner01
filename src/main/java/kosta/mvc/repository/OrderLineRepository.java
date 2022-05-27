package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;

public interface OrderLineRepository extends JpaRepository<OrderLine, Long> {

}
