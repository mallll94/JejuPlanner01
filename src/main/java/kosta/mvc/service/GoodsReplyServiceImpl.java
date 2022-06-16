package kosta.mvc.service;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsReply;
import kosta.mvc.domain.QGoodsReply;
import kosta.mvc.repository.GoodsReplyRepository;
import kosta.mvc.repository.GoodsRepository;
import kosta.mvc.repository.UserRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

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
	public void addGoodsReply(GoodsReply goodsReply, String uploadPath) {
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


	/**
	 * userId goodsID 비교에서 후기 여부 확인
	 * 
	 * */
	public List<GoodsReply> selectByGoodsReplyCheck(Long goodsId, String userId){
		QGoodsReply goodsReply = QGoodsReply.goodsReply;
		BooleanBuilder builder = new BooleanBuilder();
		
		builder.and(goodsReply.goods.goodsId.eq(goodsId));
		builder.and(goodsReply.user.userId.eq(userId));
		
		List<GoodsReply> list =(List<GoodsReply>) goodsReplyRepository.findAll(builder);
		
		
		
		return list;
	}
	
	
}
