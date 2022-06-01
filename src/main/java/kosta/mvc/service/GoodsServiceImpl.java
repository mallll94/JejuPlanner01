package kosta.mvc.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.mvc.domain.Goods;
import kosta.mvc.repository.GoodsRepository;

import lombok.NoArgsConstructor;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsRepository goodsRepository;
	
	@Override
	public void addGoods(Goods goods) {
		// TODO Auto-generated method stub
		goodsRepository.save(goods);
	}

	@Override
	public void updateGoods(Goods goods) {
		// TODO Auto-generated method stub
		goodsRepository.save(goods);
	}

	@Override
	public List<Goods> getAllGoods() {
		// TODO Auto-generated method stub
		List<Goods> goodsList = goodsRepository.findAll();
		return goodsList;
	}

	@Override
	public void deleteGoods(Long goodsId) {
		// TODO Auto-generated method stub
		goodsRepository.deleteById(goodsId);
	}

	@Override
	@Transactional(readOnly = true)
	public Goods getGoodsByGoodsId(Long goodsId) throws Exception {
		// TODO Auto-generated method stub
		Optional<Goods> goods = goodsRepository.findById(goodsId);
		return goods.orElseThrow(() -> new Exception("잘못된 조회입니다."));
	}

	@Override
	public List<Goods> getAllGoodsOrderBySalesAmount() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Goods> getAllGoodsOrderByStars() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Goods> getAllGoodsByPlanner() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Goods> getAllGoodsByPlace() {
		// TODO Auto-generated method stub
		return null;
	}

}
