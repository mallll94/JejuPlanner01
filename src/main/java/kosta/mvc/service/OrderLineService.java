package kosta.mvc.service;

import kosta.mvc.domain.OrderLine;

import java.util.List;

public interface OrderLineService {
	
	/**
	 * 주문 상품 추가하기
	 */
	public void addOrderLine(OrderLine orderLine);
	
	/**
	 * 주문 상품 취소하기
	 */
	public void deleteOrderLine(Long orderLineId);

	/**
	 * 주문 전체 조회하기
	 */
	public List<OrderLine> getAllOrderLines();
}
