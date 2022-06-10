package kosta.mvc.service;

import kosta.mvc.domain.GoodsLine;

public interface GoodsLineService {

	/**
	 * 상품상세 등록 
	 * @return 
	 * */
	GoodsLine goodsLineCart(GoodsLine goodsLine);
	
	/**
	 * 상품상세 검색
	 * 
	 * */
	GoodsLine goodsLineSelect(Long id);
}
