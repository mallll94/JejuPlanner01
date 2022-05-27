package kosta.mvc.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Orders;
public interface OrdersRepository extends JpaRepository<Orders, Long> {

}
