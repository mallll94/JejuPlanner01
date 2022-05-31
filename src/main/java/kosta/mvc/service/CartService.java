package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Cart;

public interface CartService {

	/**
	 * 장바구니 등록
	 */
	
	public void addCart(Cart cart);
	
	/**
	 * 장바구니 수정하기
	 */
	
	public void updateCart(Cart cart);
	
	/**
	 * 장바구니 삭제하기
	 */
	
	public void deleteCart(Long cartId);
	
	/*
	 * 장바구니 개별 조회하기
	 */
	
	public Cart getCart(Long cartID);
	
	/**
	 * 유저아이디로 카트 조회하기
	 */
	
	public List<Cart> getAllCart(Long userId);
}
