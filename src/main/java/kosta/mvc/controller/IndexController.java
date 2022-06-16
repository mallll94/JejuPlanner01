package kosta.mvc.controller;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.PlanBoard;
import kosta.mvc.dto.PlanBoardDTO;
import kosta.mvc.service.GoodsService;
import kosta.mvc.service.PlanBoardService;
import lombok.RequiredArgsConstructor;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class IndexController {

	private final GoodsService goodsService;
	private final PlanBoardService planBoardService;
	
	private final static int RANK_COUNT=6;

	@RequestMapping("/")
	public ModelAndView index(Model model) {
		//베스트상품
		List<Goods> bestGoods = goodsService.getAllGoodsOrderBySalesAmount();
		model.addAttribute("bestGoods", bestGoods);
		
		//추천 플래너 게시물
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		//순위구하기
	   Pageable pageable = PageRequest.of(0, RANK_COUNT,Direction.DESC,"likesCount");
	   List<PlanBoard> plist =planBoardService.recommendPlan(pageable);
	   List<PlanBoardDTO> planboardlist = new ArrayList<PlanBoardDTO>();
	   
	   for(PlanBoard p:plist) {
		   planboardlist.add(new PlanBoardDTO(p.getPboardId(), p.getUserPlan().getPlannerId(), p.getUserPlan().getPlannerCount(),
				   p.getPboardCategory(), p.getPboardTitle(), p.getPboardContent(), p.getPboardAttach(), p.getPboardRegdate().format(format), p.getLikesCount()));
	   }
	   
	   model.addAttribute("planBoardList", planboardlist);
		
		return new ModelAndView("index");
	}
}
