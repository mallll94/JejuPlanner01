package kosta.mvc.service;

import java.time.LocalDate;
import java.util.List;

import kosta.mvc.domain.TimeDeal;

public interface TimeDealService {
	/**
	 * 핫딜 상품 조회하기
	 */
	public List<TimeDeal> getAllTimeDeal();

	/**
	 * 핫딜 상품 등록하기
	 */
	public void addTimeDeal(TimeDeal timeDeal);
	
	/**
	 * 핫딜 수정하기
	 */
	public void updateTimeDeal(TimeDeal timeDeal);
	
	/**
	 * 핫딜 삭제하기
	 */
	public void deleteTimeDeal(Long timedaelId);
	
	/**
	 * 핫딜 판매중만 조회하기
	 */
	public void getTimeDealByCanBuy (LocalDate userEndDate);
	
}
