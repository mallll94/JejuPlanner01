package kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Cart;
import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.Users;
import kosta.mvc.service.CartService;
import kosta.mvc.service.GoodsLineService;
import kosta.mvc.service.GoodsService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {

	private final GoodsLineService goodsLineService;
	private final GoodsService goodsService;
	private final CartService cartService;
	
	@RequestMapping("/{url}")
	public void init() {}
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public Cart selectAll() throws Exception {
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Cart cart=cartService.select(users);
		
		
		return cart;
	}
	
	
	@RequestMapping("/cartInsert")
	public String insert(GoodsLine goodsLine,Long goodsId) throws Exception {//goodsId ,count ,date는 productDetail 생성후 이름값 비교해서 변경해줘야함
		Users user=(Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Goods goods = goodsService.getGoodsByGoodsId(goodsId);
		goodsLine.setGoods(goods);
		cartService.addCart(goodsLine,user);
		
		return "/goods/test";
	}
}
