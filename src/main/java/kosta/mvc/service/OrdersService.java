package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;

import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;
import kosta.mvc.domain.Users;

public interface OrdersService {

	/**
	 * 주문 등록하기
	 */
	public Long addOrders(List<GoodsLine> list,String name, String email, String phone,int totalPrice,Users users,String text,String type );
	
	/**
	 * 주문 취소하기
	 */
	public void deleteOrders(Long ordersId);
	
	/**
	 * 주문 전체 조회하기
	 */
	public List<Orders> getOrders();
	
	/**
	 * 유저 아이디로 주문 조회하기
	 */
	public List<Orders> getOrdersByUserId(String userId);
	
	/**
	 * 주문 아이디로 특정 주문 조회하기
	 */
	public Orders getOrdersByOrdersId();
	
	/**
	 * 주문 번호로 주문 상세 취소
	 */
//	public Orders getOrdersByOrdersId();
	
	/**
	 * 주문 카테고리별 검색
	 */
	public List<OrderLine> getOrdersByCatagory(String catagory);
	
	
	public Page<Orders> selectByCata(String filter, int nowPage, int PageCount);
}
