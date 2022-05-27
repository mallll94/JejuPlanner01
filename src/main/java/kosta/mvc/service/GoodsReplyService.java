package kosta.mvc.service;

import kosta.mvc.domain.GoodsReply;

public interface GoodsReplyService {
	
	/**
	 * 후기 등록하기
	 */
	public void addGoodsReply(GoodsReply goodsReply);
	
	/**
	 * 후기 삭제하기
	 */
	public void deleteGoodsReply(Long goodsReplyId);
	
	/**
	 * 후기 수정하기
	 */
	public void updateGoodsReply(GoodsReply goodsReply);
}
