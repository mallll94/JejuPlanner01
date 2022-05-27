package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Long> {
	
	/**
	 * 주문 등록하기
	 */
	public void insertOrders(Orders orders);
	
	/**
	 * 주문 취소하기
	 */
	//public void deleteOrders(Long ordersId);
	
	/**
	 * 주문 전체 조회하기
	 */
	public List<Orders> selectOrders();
	
	/**
	 * 유저 아이디로 주문 조회하기
	 */
	public List<Orders> selectOrdersByUserId();
	
	/**
	 * 주문 아이디로 특정 주문 조회하기
	 */
	public Orders selectOrdersByOrdersId();
	
	/**
	 * 주문 번호로 주문 상세 취소
	 */
//	public Orders getOrdersByOrdersId();
	
	/**
	 * 주문 아이디로 주문 상세 조회하기
	 */

}
