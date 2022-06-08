package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Cart;
import kosta.mvc.domain.Place;

public interface CartRepository extends JpaRepository<Cart, Long>/* , QuerydslPredicateExecutor<Cart> */ {

}
