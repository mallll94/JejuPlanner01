package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Goods;

public interface GoodsService {
	
	/**
	 * 상품 등록하기
	 */
	public void addGoods(Goods goods);

	/**
	 * 상품 수정하기
	 */
	public void updateGoods(Goods goods);
	
	/**
	 * 전체 상품 조회하기
	 */
	public List<Goods> getAllGoods();
	
	/**
	 * 상품 삭제하기
	 */
	public void deleteGoods(Long goodsId);
	
	/**
	 * 상품 이름으로 상품 조회하기
	 */
	public Goods getGoodsByGoodsId(Long goodsId) throws Exception;
	
	/**
	 * 상품 판매량 순으로 조회하기
	 */
	public List<Goods> getAllGoodsOrderBySalesAmount();
	
	/**
	 * 상품 별점순으로 조회하기
	 */
	public List<Goods> getAllGoodsOrderByStars();
	
	/**
	 * 실시간 검색 순위 -> 어따넣을지 고민
	 */
//	public List<Goods> getAllGoodsOrderByKeyword();
	
	/**
	 * 플래너 기반 상품 조회
	 */
	public List<Goods> getAllGoodsByPlanner();
	
	/**
	 * 지역 기반 상품 조회
	 */
	public List<Goods> getAllGoodsByLocalCategory();

}
