package kosta.mvc.controller;

import java.util.HashMap;
import java.util.Map;

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
import kosta.mvc.dto.GoodsLineDTO;
import kosta.mvc.dto.UsersDTO;
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
	
	@RequestMapping("/select")
	@ResponseBody
	public Map<String, Object> selectAll(){
		Map<String, Object> map = new HashMap<String, Object>();
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Cart cart=cartService.select(users);
		/*
		UsersDTO usersDTO = new UsersDTO(cart.getUser().getUserId(), cart.getUser().getUserName(), 
				cart.getUser().getUserPassword(), cart.getUser().getUserPhone(), cart.getUser().getUserEmail(),
				cart.getUser().getJoinDate(), cart.getUser().getUserState(), cart.getUser().getUserGender(), cart.getUser().getRole());
		*/
		GoodsLineDTO goodsLineDTO = new GoodsLineDTO(cart.getGoodsLine().getGoodsLineId(), cart.getGoodsLine().getGoods(),cart.getGoodsLine().getGoodsLineAmount(), cart.getGoodsLine().getGoodsLineDate());
		map.put("cart", cart);
		map.put("goodsLine",goodsLineDTO);
		return map;
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
