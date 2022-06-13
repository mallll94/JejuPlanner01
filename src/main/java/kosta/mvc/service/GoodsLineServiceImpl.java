package kosta.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.GoodsLine;
import kosta.mvc.repository.GoodsLineRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class GoodsLineServiceImpl implements GoodsLineService {

	private final GoodsLineRepository goodsLineRep;
	
	@Override
	public GoodsLine goodsLineCart(GoodsLine goodsLine) {
		
		return goodsLineRep.save(goodsLine);
		
	}

	@Override
	public GoodsLine goodsLineSelect(Long id) {
		GoodsLine goodsline = goodsLineRep.getById(id);
		System.out.println(goodsline.getGoodsLineId());
		System.out.println(goodsline.getGoodsLineAmount());
		System.out.println("service");
		return goodsline;
	}

}
