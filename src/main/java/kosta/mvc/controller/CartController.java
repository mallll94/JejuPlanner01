package kosta.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import kosta.mvc.dto.GoodsDTO;
import kosta.mvc.dto.GoodsLineDTO;
import kosta.mvc.dto.UsersDTO;
import kosta.mvc.service.CartService;
import kosta.mvc.service.GoodsLineService;
import kosta.mvc.service.GoodsService;
import lombok.Getter;
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
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Map<String, Object> map = new HashMap<String, Object>();
		List<GoodsDTO> goodsDTOList = new ArrayList<GoodsDTO>();
		List<GoodsLineDTO> goodsLineDTOList= new ArrayList<GoodsLineDTO>();
		List<Cart> cart=cartService.select(users);
		

		for(Cart x : cart) {
			goodsDTOList.add(new GoodsDTO(x.getGoodsLine().getGoods().getGoodsId(),
					x.getGoodsLine().getGoods().getPlace(), x.getGoodsLine().getGoods().getGoodsLocalCategory(), x.getGoodsLine().getGoods().getGoodsCategory(),
					x.getGoodsLine().getGoods().getGoodsName(), x.getGoodsLine().getGoods().getGoodsPrice(),
					x.getGoodsLine().getGoods().getGoodsContent(), x.getGoodsLine().getGoods().getGoodsPhoto(), x.getGoodsLine().getGoods().getGoodsAddr()));
			
			goodsLineDTOList.add(new GoodsLineDTO(x.getGoodsLine().getGoodsLineId(), null, x.getGoodsLine().getGoodsLineAmount(), x.getGoodsLine().getGoodsLineDate()));
			
		}
		System.out.println(goodsLineDTOList.get(0).getGoodsLineAmount());
		
		map.put("cart", cart);
		map.put("goods",goodsDTOList);
		map.put("goodsLine",goodsLineDTOList);
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
	
	@RequestMapping("/cartDelete")
	@ResponseBody
	public void delete(Long [] deleteBox) throws Exception {//goodsId ,count ,date는 productDetail 생성후 이름값 비교해서 변경해줘야함	
		for(Long x : deleteBox) {
			cartService.deleteCart(x);
		}
	}
}
