package kosta.mvc.service;

import kosta.mvc.domain.GoodsReply;
import kosta.mvc.repository.GoodsReplyRepository;

import java.util.List;

public class GoodsReplyServiceImpl implements GoodsReplyService {
	private GoodsReplyRepository goodsReplyRepository;

	@Override
	public void addGoodsReply(GoodsReply goodsReply) {

	}

	@Override
	public void deleteGoodsReply(Long goodsReplyId) {

	}

	@Override
	public void updateGoodsReply(GoodsReply goodsReply) {

	}

	@Override
	public List<GoodsReply> getAllGoodsReply() {
		return goodsReplyRepository.findAll();
	}
}
