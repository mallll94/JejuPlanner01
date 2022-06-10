package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;
public interface OrderLineRepository extends JpaRepository<OrderLine, Long>, QuerydslPredicateExecutor<OrderLine> {
	
	


}
