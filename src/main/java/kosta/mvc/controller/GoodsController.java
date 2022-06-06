package kosta.mvc.controller;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.Place;
import kosta.mvc.service.GoodsService;
import kosta.mvc.service.PlaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/goods")
public class GoodsController {

	private final GoodsService goodsService;

	private final PlaceService placeService;

	/**
	 * 관리자
	 * TODO: admin controller로 이동할것
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
	public ModelAndView getGoodsListView(@RequestParam("category") String category, Model model) {
		List<Goods> goodsList = goodsService.getAllGoodsByCategory(category);
		model.addAttribute("goodsList", goodsList);
		return new ModelAndView("goods/goods_List");
	}

	@GetMapping("/view/goods_Main")
	public ModelAndView getGoodsMainView(Model model) {
		return new ModelAndView("goods/goods_Main");
	}
	
	@GetMapping("/view/goods_View/{goodsId}")
	public ModelAndView getGoodsMainView(@PathVariable("goodsId") Long goodsId, Model model) throws Exception {
		Goods goods = goodsService.getGoodsByGoodsId(goodsId);
		model.addAttribute("goods", goods);
		return new ModelAndView("goods/goods_View");
		
		
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
