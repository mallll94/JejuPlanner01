package kosta.mvc.controller;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsReply;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.Users;
import kosta.mvc.service.GoodsReplyService;
import kosta.mvc.service.GoodsService;
import kosta.mvc.service.PlaceService;
import lombok.RequiredArgsConstructor;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/goods")
public class GoodsController {

	private final GoodsService goodsService;
	
	private final GoodsReplyService goodsReplyService;

	private final PlaceService placeService;

	@RequestMapping("/test")
	public void init() {}
	/**
	 * 
	 * 관리자
	 * TODO: admin controller로 이동할것
	 */
//	@RequestMapping("/admin/goods_Admin")
//	public ModelAndView listForAdmin(Model model) {
//		List<Goods> goodsList = goodsService.getAllGoods();
//		List<Place> placeList = placeService.selectAll();
//		model.addAttribute("goodsList", goodsList);
//		model.addAttribute("placeList", placeList);
//		return new ModelAndView("admin/goods_Admin");
//	}
	/**
	 * 카테고리별 검색
	 * @param category
	 * @param model
	 * @return
	 */
	@GetMapping("/view/goods_List/category")
	public ModelAndView getGoodsListViewCategory(@RequestParam("category") String category, Model model) {
		List<Goods> goodsList = goodsService.getAllGoodsByCategory(category);
		model.addAttribute("goodsList", goodsList);
		return new ModelAndView("goods/goods_List");
	}
	
	@GetMapping("/view/goods_List/lowPrice")
	public ModelAndView getGoodsListViewlowPrice(Model model) {
		List<Goods> goodsList = goodsService.getAllGoodsOrderByPrice();
		model.addAttribute("goodsList", goodsList);
		return new ModelAndView("goods/goods_List");
	}
	
	@GetMapping("/view/goods_List/bestGoods")
	public ModelAndView getGoodsListViewBest(Model model) {
		List<Goods> goodsList = goodsService.getAllGoodsOrderBySalesAmount();
		model.addAttribute("goodsList", goodsList);
		return new ModelAndView("goods/goods_List");
	}
	
	/**
	 * 지역별 검색
	 * @param localCategory
	 * @param model
	 * @return
	 */
	@GetMapping("/view/goods_List/localCategory")
	public ModelAndView getGoodsListViewLocalCategory(@RequestParam("localCategory") String localCategory, Model model) {
		List<Goods> goodsList = goodsService.getAllGoodsByLocalCategory(localCategory);
		model.addAttribute("goodsList", goodsList);
		return new ModelAndView("goods/goods_List");
	}
		
	
	@PostMapping("/view/goods_List/plannerCategory")
	public ModelAndView getGoodsListViewPlannerCategory() {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Goods> goodsList = goodsService.getAllGoodsByPlanner(users);

		return new ModelAndView("goods/goods_List","goodsList", goodsList);
	}
	
	@GetMapping("/view/goods_Main")
	public ModelAndView getGoodsMainView(Model model) {
		List<Goods> goodsList = goodsService.getAllGoodsOrderBySalesAmount();
//		System.out.println(goodsList.size());
		model.addAttribute("goodsList", goodsList);
		return new ModelAndView("goods/goods_Main");
	}
	
	

	
	@GetMapping("/view/goods_View/{goodsId}")
	public ModelAndView getGoodsMainView(@PathVariable("goodsId") Long goodsId, Model model) throws Exception {
		Goods goods = goodsService.getGoodsByGoodsId(goodsId);
		List<GoodsReply> goodsReplyList = goodsReplyService.getGoodsReplyByGoodsId(goodsId);
		model.addAttribute("goodsReplyList", goodsReplyList);
		model.addAttribute("goods", goods);
		return new ModelAndView("goods/goods_View");
		
		
	}
	@PostMapping("")
	public String addGoods(Goods goods,HttpSession session) {
		System.out.println(goods.getGoodsId());
		//file upload경로
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/goods/";
		goodsService.addGoods(goods,uploadPath);
		return "redirect:/admin/goods_Admin";
	}
	
	@RequestMapping("/updateForm")
	@ResponseBody
	public Goods getGoodsByGoodsIdAjax(Long goodsId) {
		Goods goods = goodsService.getGoodsByGoodsId(goodsId);
		return goods;
	}

	//PutMapping("/{goodsId}")
	@RequestMapping("/updateGoods")
	public String updateGoods(Goods goods, HttpSession session) {
		System.out.println("===========수정하기!!"+goods.getGoodsId()+"==========");
		//goods.setGoodsId(goodsId);
		//file upload경로
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/goods/";
		goodsService.updateGoods(goods,uploadPath);
		return "redirect:/admin/goods_Admin";
	}

	@DeleteMapping("/{goodsId}")
	public void deleteGoods(@PathVariable Long goodsId) {
		goodsService.deleteGoods(goodsId);
	}

	@GetMapping("/{goodsId}")
	public void getGoodsByGoodsId(@PathVariable Long goodsId, Model model) {
		Goods goods = goodsService.getGoodsByGoodsId(goodsId);
			model.addAttribute("goods", goods);
	}
	
	
	
	
	
	@RequestMapping("/search")
	public String searchKeyWord(String keyWord,Model model) {
		
		List<Goods> list=goodsService.searchByGoods(keyWord);
		model.addAttribute("goodsList", list);
		
		return "goods/goods_List";
	}
}
