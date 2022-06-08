package kosta.mvc.service;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsReply;
import kosta.mvc.repository.GoodsReplyRepository;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
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

	@Override
	public List<GoodsReply> getGoodsReplyByGoodsId(Long goodsId) {
		// TODO Auto-generated method stub
		Goods goods = new Goods();
		goods.setGoodsId(goodsId);
		return goodsReplyRepository.findGoodsReplyByGoods(goods);
	}
	
	
}
