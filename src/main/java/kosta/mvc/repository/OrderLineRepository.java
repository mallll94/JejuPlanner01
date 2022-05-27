package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.OrderLine;
public interface OrderLineRepository extends JpaRepository<OrderLine, Long> {
	
	
	/**
	 * 주문 상품 추가하기
	 */
	public void insertOrderLine(OrderLine orderLine);
	
	/**
	 * 주문 상품 취소하기
	 */
	//public void deleteOrderLine(Long orderLineId);
	

}
