package kosta.mvc.service;

import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;

import java.util.List;
import java.util.Map;

public interface OrderLineService {
	
	/**
	 * 주문 상품 추가하기
	 */
	public void addOrderLine(Orders orders,List<GoodsLine> list, int orderLinePrice);
	
	/**
	 * 주문 상품 취소하기
	 */
	public void deleteOrderLine(Long orderLineId);
	
	/**
	 * 주문 상품 삭제하기
	 */
	public void deleteOrder(Long orderLineId);

	/**
	 * 주문 전체 조회하기
	 */
	public List<OrderLine> getAllOrderLines();
	
	/**
	 * 카테고리별 조회
	 * */
	public Map<String, Object> cataOrderLines(String cata);
	
	/**
	 * 주문상세 아이디로조회
	 * */
	public OrderLine selectById(Long orderLineId);
}
