package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.FreeBoard;
import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsReply;
import kosta.mvc.domain.Users;
import kosta.mvc.service.GoodsReplyService;
import kosta.mvc.service.GoodsService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
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
	}
		
	/**
	 * 후기 삭제하기
	 * @return 
	 */
	@DeleteMapping("/{goodsReplyId}")
	public void deleteGoodsReply(@PathVariable Long goodsReplyId) {
		goodsReplyService.deleteGoodsReply(goodsReplyId);
		
	}
		
	/**
	 * 후기 작성하기
	 */
	@PostMapping("")
	public void addGoodsReply(GoodsReply goodsReply) {
		goodsReplyService.addGoodsReply(goodsReply);
		
	}
		
	/**
	 * 해당 상품 후기 조회하기(사용자)
	 */
	@GetMapping("/view/goodsReply_View/{goodsId}")
	public ModelAndView getGoodsReplyListViewGoodsId(@PathVariable Long goodsId, Model model) {
		List<GoodsReply> goodsReplyList = goodsReplyService.getGoodsReplyByGoodsId(goodsId);
		model.addAttribute("goodsReplyList", goodsReplyList);
		return new ModelAndView("goods/goodsReply_View");
		
	}
			
}

	

