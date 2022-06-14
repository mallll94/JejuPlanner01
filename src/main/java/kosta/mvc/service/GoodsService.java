package kosta.mvc.service;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.Users;

import java.util.List;

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
	 * 상품 ID로 상품 조회하기
	 */
	public Goods getGoodsByGoodsId(Long goodsId) throws Exception;
	
	/**
	 * 상품 이름으로 상품 조회하기
	 */
	public List<Goods> getGoodsByGoodsName(String goodsName) throws Exception;

	/**
	 * 상품 판매량 순으로 조회하기
	 */
	public List<Goods> getAllGoodsOrderBySalesAmount();

//	/**
//	 * 상품 별점순으로 조회하기
//	 */
//	public List<Goods> getAllGoodsOrderByStars();

	/**
	 * 플래너 기반 상품 조회
	 */
	public List<Goods> getAllGoodsByPlanner(Users users);

	/**
	 * 카테고리 기반 상품 조회
	 */
	public List<Goods> getAllGoodsByCategory(String category);

	/**
	 * 지역 기반 상품 조회
	 */
	public List<Goods> getAllGoodsByLocalCategory(String localCategory);
	
	/**
	 * 헤더부분 검색기능
	 * */
	List<Goods> searchByGoods(String keyWord);

}
