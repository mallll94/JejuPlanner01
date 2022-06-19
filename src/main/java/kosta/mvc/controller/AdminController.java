package kosta.mvc.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsReply;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.Users;
import kosta.mvc.service.GoodsReplyService;
import kosta.mvc.service.GoodsService;
import kosta.mvc.service.OrdersService;
import kosta.mvc.service.PlaceService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	
	private final PlaceService placeService;
	private final UserService userService;
	private final OrdersService ordersService;
	private final GoodsService goodsService;
	private final GoodsReplyService goodsReplyService;
	
	private final static int PAGE_COUNT=15;
	private final static int BLOCK_COUNT=4;
	private static final String PATH_SAVE="C:\\Edu\\Spring\\springWork\\Jeju\\src\\main\\webapp\\WEB-INF\\img";
	
	@RequestMapping("/{url}")
	public void test() {}
	
	@RequestMapping("/all")
	@ResponseBody
	public Map<String, Object> selectAll(String filter,String name,@RequestParam(defaultValue = "1")int nowPage) {
		System.out.println(nowPage);
		Map<String, Object> map = new HashMap<String, Object>();
		//페이징처리하기
		//Page<Place> pageList = null;
		
		//Page<Place>	pageList = placeService.selectAll(nowPage, PAGE_COUNT);
		
		
		Page<Place> pageList = placeService.selectByCata(filter, name,nowPage,PAGE_COUNT);
		System.out.println(pageList);
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;
		
		map.put("pageList", pageList);
		map.put("totalPages", pageList.getTotalPages());
		map.put("nowPage", nowPage);
		map.put("blockCount", BLOCK_COUNT);
		map.put("startPage", startPage);
		
		
		return map;
		
	}
	

	
	@RequestMapping(value ="/placeInsert", method = RequestMethod.POST)
	public String insert(Place place, HttpSession session){
		System.out.println("1번문제");
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/place/";
		//String uploadPath = session.getServletContext().getRealPath("/img/")+"place";
		System.out.println("2번문제");
		placeService.insertPlace(place,uploadPath);
		
		
		return "redirect:/admin/list";
	}
	
//	@RequestMapping("/modalSelect")
//	@ResponseBody
//	public Place insert(String name) {
//		Optional<Place> optional =placeService.selectByName(name);	
//		Place result = optional.orElse(null);
//		
//		return result;
//	}
	
	@RequestMapping("/modalSelect")
	@ResponseBody
	public Place insert(Long placeId) {
		Place dbplace =placeService.selectById(placeId);
		
		
		return dbplace;
	}
	
	
	@RequestMapping(value="/placeUpdate", method = RequestMethod.POST)
	public String update(Place place, HttpSession session) {
		System.out.println(place.getPlaceId());
		String uploadPath = session.getServletContext().getRealPath("/WEB-INF/") + "upload/place/";
		
		placeService.updatePlace(place,uploadPath);
		
		System.out.println("여기서 문제인가?");
		return "redirect:/admin/list";
	}
	
	@RequestMapping("/placeDelete")
	public String delete(Place place) {
		
		placeService.deletePlace(place.getPlaceId());
		return "admin/list";
	}
	
	
	@RequestMapping("/userAdmin")
	@ResponseBody
	public Map<String, Object> userAdmin(String filter,String name,@RequestParam(defaultValue = "1")int nowPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		
		Page<Users> userList = userService.selectByCata(filter, nowPage, PAGE_COUNT);
		System.out.println("1231");
		System.out.println(userList);
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;
		
		map.put("pageList", userList);
		map.put("totalPages", userList.getTotalPages());
		map.put("nowPage", nowPage);
		map.put("blockCount", BLOCK_COUNT);
		map.put("startPage", startPage);
		
		
		
		/*
		System.out.println(pageList);
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;
		
		map.put("pageList", pageList);
		map.put("totalPages", pageList.getTotalPages());
		map.put("nowPage", nowPage);
		map.put("blockCount", BLOCK_COUNT);
		map.put("startPage", startPage);
		*/
		
		return map;
		
	}
	
	
	@RequestMapping("/totalData")
	@ResponseBody
	public Map<String, Object> totalData(String goodsCategory){
		int totalSum = 0;
		int monthSum = 0;
		int cataSum =0;

		Map<String,  Object> map = new HashMap<String, Object>();
		Month month=LocalDate.now().getMonth();
		List<Integer> chart = new ArrayList<Integer>();
		
		List<Orders> orderList = ordersService.getOrders();
		List<OrderLine> orderCataList=ordersService.getOrdersByCatagory(goodsCategory);
		
		
		List<OrderLine> orderCataList1=ordersService.getOrdersByCatagory("대여");
		List<OrderLine> orderCataList2=ordersService.getOrdersByCatagory("입장권");
		List<OrderLine> orderCataList3=ordersService.getOrdersByCatagory("액티비티");
		List<OrderLine> orderCataList4=ordersService.getOrdersByCatagory("스파/힐링");
		int sum1 = 0;
		int sum2 = 0;
		int sum3 = 0;
		int sum4 = 0;
		
		for(Orders or : orderList) {
			totalSum +=or.getOrdersPrice();	
			if(or.getOrdersDate().getMonth() ==month) {
				monthSum += or.getOrdersPrice();
			}
		}
		for(OrderLine o : orderCataList) {	
			cataSum+=o.getOrderLinePrice();
		}
		
		for(OrderLine o : orderCataList1) {	
			sum1+=o.getOrderLinePrice();
		}
		for(OrderLine o : orderCataList2) {	
			sum2+=o.getOrderLinePrice();
		}
		for(OrderLine o : orderCataList3) {	
			sum3+=o.getOrderLinePrice();
		}
		for(OrderLine o : orderCataList4) {	
			sum4+=o.getOrderLinePrice();
		}
	
		System.out.println(totalSum +" | "+monthSum+" | "+cataSum);
		
		map.put("rentSum", sum1);
		map.put("inSum", sum2);
		map.put("actSum", sum3);
		map.put("spaSum", sum4);
		
		map.put("chartMonth", chart);
		map.put("cataSum",cataSum);
		map.put("totalSum", totalSum);
		map.put("monthSum", monthSum);
		return map;
	}
	
	
	@RequestMapping("/orderUserAdmin")
	@ResponseBody
	public Map<String, Object> orderUserAdmin(String name,@RequestParam(defaultValue = "1")int nowPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		
		Page<Orders> userList = ordersService.selectByCata(null, nowPage, PAGE_COUNT);

		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;
		
		map.put("pageList", userList);
		map.put("totalPages", userList.getTotalPages());
		map.put("nowPage", nowPage);
		map.put("blockCount", BLOCK_COUNT);
		map.put("startPage", startPage);
		
		return map;
		
	}
	
	
	@RequestMapping("/goods_Admin")
	public ModelAndView listForAdmin(Model model) {
		List<Goods> goodsList = goodsService.getAllGoods();
		List<Place> placeList = placeService.selectAll();
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("placeList", placeList);
		return new ModelAndView("admin/goods_Admin");
	}
	
	
	@RequestMapping("/goodsReply_Admin")
	public ModelAndView listForAdmin1(Model model) {
		List<GoodsReply> goodsReplyList = goodsReplyService.getAllGoodsReply();
		List<Goods> goodsList = goodsService.getAllGoods();
		List<Users> usersList = userService.selectAll();
		model.addAttribute("goodsReplyList", goodsReplyList);
		model.addAttribute("goodsList", goodsList);
		
		return new ModelAndView("admin/goodsReply_Admin");
	}
		
	
	
	
}
