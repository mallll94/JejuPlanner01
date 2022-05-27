package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Orders;

public interface OrdersService {

	/**
	 * 주문 등록하기
	 */
	public void addOrders(Orders orders);
	
	/**
	 * 주문 취소하기
	 */
	public void cancelOrders(Long ordersId);
	
	/**
	 * 주문 전체 조회하기
	 */
	public List<Orders> getOrders();
	
	/**
	 * 유저 아이디로 주문 조회하기
	 */
	public List<Orders> getOrdersByUserId();
	
	/**
	 * 주문 아이디로 특정 주문 조회하기
	 */
	public Orders getOrdersByOrdersId();
	
	/**
	 * 주문 번호로 주문 상세 취소
	 */
//	public Orders getOrdersByOrdersId();
	
	/**
	 * 주문 아이디로 주문 상세 조회하기
	 */
}
