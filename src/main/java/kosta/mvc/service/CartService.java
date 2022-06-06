package kosta.mvc.service;

import kosta.mvc.domain.Cart;
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
	
	/**
	 * 장바구니 전체 삭제하기
	 */
	
	/**
	 * 장바구니 조회하기
	 */
	Cart select(Users user);
	

}