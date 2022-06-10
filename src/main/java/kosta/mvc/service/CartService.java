package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Cart;
import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.Users;

public interface CartService {

	/**
	 * 장바구니 등록
	 */
	public void addCart(GoodsLine goodsLine,Users users);
	

	/**
	 * 장바구니 부분 삭제하기
	 */
	void deleteCart(Long id);
	
	/**
	 * 장바구니 전체 삭제하기
	 */
	
	
	/**
	 * 장바구니 수정
	 * */
	void updateCart(Long [] cartId , int [] countCart);
	
	
	/**
	 * 장바구니 조회하기
	 */
	List<Cart> select(Users user);
	
	/**
	 * 주문시 장바구니 내역 조회
	 * */
	List<GoodsLine> selectByCartId(Long [] cartId);

}