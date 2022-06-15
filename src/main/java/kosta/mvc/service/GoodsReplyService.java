package kosta.mvc.service;

import kosta.mvc.domain.GoodsReply;

import java.util.List;

public interface GoodsReplyService {

	/**
	 * 후기 등록하기
	 */
	public void addGoodsReply(GoodsReply goodsReply, String uploadPath);

	/**
	 * 후기 삭제하기
	 */
	public void deleteGoodsReply(Long goodsReplyId);

	/**
	 * 후기 전체 조회하기
	 */
	public List<GoodsReply> getAllGoodsReply();
	
	/**
	 * goodsId로 후기 조회하기
	 */
	public List<GoodsReply> getGoodsReplyByGoodsId(Long goodsId);
	
}
