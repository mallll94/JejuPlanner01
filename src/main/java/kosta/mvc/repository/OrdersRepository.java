package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Long>, QuerydslPredicateExecutor<Orders> {
	


}
