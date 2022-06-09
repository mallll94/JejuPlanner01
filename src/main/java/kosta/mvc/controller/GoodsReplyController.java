package kosta.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	/**
	 * 관리자 페이지.
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/goodsReply_Admin")
	public ModelAndView listForAdmin(Model model) {
		List<GoodsReply> goodsReplyList = goodsReplyService.getAllGoodsReply();
		List<Goods> goodsList = goodsService.getAllGoods();
		List<Users> usersList = userService.selectAll();
		model.addAttribute("goodsReplyList", goodsReplyList);
		model.addAttribute("goodsList", goodsList);
		
		return new ModelAndView("admin/goodsReply_Admin");
		
	/**
	 * 관리자 후기 삭제하기
	 */
		
		
	/**
	 * 후기 작성하기 (사용자)
	 */
		
		
	/**
	 * 후기 삭제하기 (사용자)
	 */
	}
			
}

	

