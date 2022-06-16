package kosta.mvc.controller;

import kosta.mvc.domain.Goods;
import kosta.mvc.service.GoodsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class IndexController {

	private final GoodsService goodsService;

	@RequestMapping("/")
	public ModelAndView index(Model model) {
		List<Goods> bestGoods = goodsService.getAllGoodsOrderBySalesAmount();
		model.addAttribute("bestGoods", bestGoods);
		return new ModelAndView("index");
	}
}
