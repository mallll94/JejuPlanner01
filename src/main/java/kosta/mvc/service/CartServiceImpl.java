package kosta.mvc.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Predicate;

import kosta.mvc.domain.Cart;
import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.QCart;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.CartRepository;
import kosta.mvc.repository.GoodsLineRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

	private final GoodsLineRepository goodsLineRep;
	
	private final CartRepository cartRep;
	
	@Override
	public void addCart(GoodsLine goodsLine,Users users) {
		Long goodsLineId = goodsLineRep.save(goodsLine).getGoodsLineId();
		System.out.println("goodsLineId : "+goodsLineId);
		GoodsLine result = goodsLineRep.findById(goodsLineId).orElse(null);
		System.out.println("GoodsLine : "+result.getGoodsLineId());
		Cart cart = new Cart(null, result, users, result.getGoodsLineAmount());
		
		cartRep.save(cart);
	}

	@Override
	public List<Cart> select(Users user) {	
		QCart cart = QCart.cart;
		BooleanBuilder builder = new BooleanBuilder();
		builder.and(cart.user.userId.equalsIgnoreCase(user.getUserId()));
		Iterable<Cart> afterResult=cartRep.findAll(builder);
		List<Cart> result = Lists.newArrayList(afterResult);
		
		return result;
	}

	@Override
	public void deleteCart(Long id) {			
		cartRep.deleteById(id);
	}

}
