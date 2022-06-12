package kosta.mvc.service;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsReply;
import kosta.mvc.repository.GoodsReplyRepository;
import kosta.mvc.repository.GoodsRepository;
import kosta.mvc.repository.UserRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class GoodsReplyServiceImpl implements GoodsReplyService {
	
	@Autowired
	private GoodsReplyRepository goodsReplyRepository;
	@Autowired
	private GoodsRepository goodsRepository;
	@Autowired
	private UserRepository userRepository;
	
	/**
	 * 등록하기
	 */
	@Override
	public void addGoodsReply(GoodsReply goodsReply) {
		goodsReplyRepository.save(goodsReply);

	}
	/**
	 * 삭제하기 
	 */
	@Override
	public void deleteGoodsReply(Long goodsReplyId) {
		GoodsReply dbGoodsReply = goodsReplyRepository.findById(goodsReplyId).orElse(null);
		if(dbGoodsReply==null) {
			throw new RuntimeException("오류로 인해 삭제할 수 없습니다.");
		}
		goodsReplyRepository.deleteById(goodsReplyId);
	}

	/**
	 * 전체보기
	 */
	@Override
	public List<GoodsReply> getAllGoodsReply() {
//		return goodsReplyRepository.findAll(Sort.by(Sort.Direction.DESC, "goodsReplyStart"));
		return goodsReplyRepository.findAll();
	}
	/**
	 * goodsID 후기만 보기 
	 */
	@Override
	public List<GoodsReply> getGoodsReplyByGoodsId(Long goodsId) {
		// TODO Auto-generated method stub
		Goods goods = new Goods();
		goods.setGoodsId(goodsId);
		System.out.println("test");
		return goodsReplyRepository.findGoodsReplyByGoods(goods);
	}



	
	
}
