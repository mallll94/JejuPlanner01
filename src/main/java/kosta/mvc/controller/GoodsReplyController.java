package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsReply;
import kosta.mvc.domain.Users;
import kosta.mvc.service.GoodsReplyService;
import kosta.mvc.service.GoodsService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class GoodsReplyController {
	
	private final GoodsReplyService goodsReplyService;
	private final GoodsService goodsService;
	private final UserService userService;
	
	@RequestMapping("/admin/goodsReply_Admin")
	public ModelAndView listForAdmin(Model model) {
		List<GoodsReply> goodsReplyList = goodsReplyService.getAllGoodsReply();
		System.out.println("test");
		List<Goods> goodsList = goodsService.getAllGoods();
		System.out.println("test");
		List<Users> usersList = userService.selectAll();
		System.out.println("test");
		model.addAttribute("goodsReplyList", goodsReplyList);
		System.out.println("test");
		model.addAttribute("goodsList", goodsList);
		System.out.println("test");
		
		return new ModelAndView("admin/goodsReply_Admin");
	}
			
}

	

