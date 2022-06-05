package kosta.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.Place;
import kosta.mvc.service.GoodsService;
import kosta.mvc.service.PlaceService;
import lombok.RequiredArgsConstructor;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
@RequestMapping("/goods")
public class GoodsController {
	
	private final GoodsService goodsService;
	
	private final PlaceService placeService;
	/**
	 *관리자
	 *TODO: admin controller로 이동할것
	 */
	@RequestMapping("/admin/goods_Admin")
	public ModelAndView listForAdmin(Model model) {
		List<Goods> goodsList = goodsService.getAllGoods();
		List<Place> placeList = placeService.selectAll();
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("placeList", placeList);
		return new ModelAndView("admin/goods_Admin");
	}
	
	@GetMapping("/view/goods_List")
	public ModelAndView getGoodsView(Model model) {
		List<Goods> goodsList = goodsService.getAllGoods();
		model.addAttribute("goodsList", goodsList);
		return new ModelAndView("goods/goods_List");
	}
	
	@PostMapping("")
	public void addGoods(Goods goods) {
		goodsService.addGoods(goods);
	}
	
	@PutMapping("/{goodsId}")
	public void updateGoods(@RequestBody Goods goods, @PathVariable Long goodsId) {
		goods.setGoodsId(goodsId);
		goodsService.updateGoods(goods);
	}
	
	@DeleteMapping("/{goodsId}")
	public void deleteGoods(@PathVariable Long goodsId) {
		goodsService.deleteGoods(goodsId);
	}
	
	@GetMapping("/{goodsId}")
	public void getGoodsByGoodsId(@PathVariable Long goodsId, Model model) {
		Goods goods;
		try {
			goods = goodsService.getGoodsByGoodsId(goodsId);
			model.addAttribute("goods", goods);
		} catch (Exception e) {
			model.addAttribute("goods", null);
		}
	}
}
