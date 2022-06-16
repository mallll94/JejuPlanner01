package kosta.mvc.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.GoodsReply;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.GoodsDTO;
import kosta.mvc.dto.GoodsLineDTO;
import kosta.mvc.dto.OrderDTO;
import kosta.mvc.dto.OrderLineDTO;
import kosta.mvc.service.GoodsLineService;
import kosta.mvc.service.GoodsReplyService;
import kosta.mvc.service.GoodsService;
import kosta.mvc.service.OrderLineService;
import kosta.mvc.service.OrdersService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	
	private final UserService userService;
	private final PasswordEncoder passwordEncoder;

	private final OrdersService ordersService;
	private final OrderLineService orderLineService;
	private final GoodsService goodsService;
	private final GoodsLineService goodsLineService;
	private final GoodsReplyService goodsReplyService;
	
	private final static int PAGE_COUNT=3;
	private final static int BLOCK_COUNT=4;
	
	@RequestMapping("/{url}")
	public void init() {}
	
	@RequestMapping("/login")
	public void login() {} 
	
	@RequestMapping("/register")
	public String insertUser(Users user, String year, String month, String day) {
		System.out.println("user.getUserEmail()"+user.getUserEmail());
		System.out.println("user.getUserPhone()"+user.getUserPhone());
		userService.insertUsers(user);
		
		return "redirect:/";
	}
	
	
	@RequestMapping("/idcheckAjax")
	@ResponseBody
	public String idcheckAjax(String id) {
		
		return userService.idcheck(id);
	}
	
	@RequestMapping("/idFind")
	public String idFind(Users user,Model model) {
		System.out.println(user.getUserEmail()+user.getUserName()+user.getUserPhone());

		String result = userService.selectbyIdandEmail(user);

		model.addAttribute("userId", result);
		return "/user/idFindResult";
	}

	@RequestMapping("/pwdFind")
	public String pwdFind(Users user,Model model) {
		//String encodePassword=PasswordEncoder.encode(user.get);

		String result = userService.findPwdCheck(user);

		model.addAttribute("userId", result);
		String url = "";
		
		if(result=="해당하는 정보가 없습니다.") {
			url="/user/idFindResult";
		}else {
			url="/user/pwdChangeForm";
		}
		
		return url;
	}
	
	@RequestMapping("/pwdUpdate")
	public String pwdUpdate(Users user) {
		System.out.println("11111111111111111111111111");
		System.out.println(user.getUserId()+user.getUserPassword());
		String encodePassword=passwordEncoder.encode(user.getUserPassword());
		System.out.println("22222222222222222222");
		System.out.println(encodePassword);
		user.setUserPassword(encodePassword);
		System.out.println("33333333333333333333333331");
		System.out.println(user.getUserPassword());
		
		userService.findUpdatePwd(user);
		
		return "user/loginForm";
	}
	
	
	@RequestMapping(value = "/kakao/callback" , method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam String code, HttpSession session) {
		System.out.println("::카카오 로그인 인증::"+code);
		
		//접속토큰 Get
		String kakaoToken = userService.kakaoGetAccessToken(code);
		
		//접속자 정보 Get
		//Map<String, Object> result = userService.getUserInfo(kakaoToken);
		//String kakaoId = (String)result.get("id");
		
		
		return "redirect:/";
	}
	
	
	@RequestMapping("/emailCheckAjax")
	@ResponseBody
	public int emailCheckAjax(String email) {
		int result=userService.emailCheck(email);
		
		
		return result;
	}
	
	/**
	 * 마이페이지 내정보
	 **/
	@RequestMapping("/myPage")
	public ModelAndView read() {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Users dbusers = userService.selectById(users.getUserId());
		return new ModelAndView("mypage/myPage", "Users" , dbusers);
		
	}
	
	/**
	 * 회원 탈퇴하기
	 **/
	@RequestMapping("/userDelete")
	public String deleteUsers(String userPassword) {
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		userService.deleteUsers(users.getUserId(), userPassword);
		SecurityContextHolder.clearContext(); //저장된 정보 삭제
		return "user/loginForm";
	}
	
	/**
	 * 회원 정보수정하기
	 **/
	@RequestMapping("/userUpdate")
	public String updateUsers(HttpServletRequest request, Users users) {
		Users dbusers = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		users.setUserId(dbusers.getUserId());
		userService.updateUsers(users);
		
		return "redirect:/user/myPage";
		
	}
	
	
	/**
	 * 마이페이지 내 예약 내역 조회
	 * */
	@RequestMapping("/myReserve")
	public String myReserve() {
		
		return "mypage/myReserve";
	}
	
	@RequestMapping("/reserveAll")
	@ResponseBody
	public Map<String, Object> myReserveSelect(@RequestParam(defaultValue = "1")int nowPage)  throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(nowPage+"현재ㅔ페이지 주소찍기");
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		Page<OrderLine> orderLine=ordersService.getOrdersByUserIdPage(users.getUserId(),nowPage,PAGE_COUNT);

		List<OrderLineDTO> resultOrderLine = new ArrayList<OrderLineDTO>();
		
		List<GoodsLineDTO> resultGoodsLine = new ArrayList<GoodsLineDTO>();
		
		List<GoodsDTO> resultGoods	= new ArrayList<GoodsDTO>();
		
		List<Integer> replyCheck = new ArrayList<Integer>();
		//내가 가지고있는 상품목록 뿌리기

		for(OrderLine result : orderLine ) {
			//
			
			List<GoodsReply> goodsReplyCheck =goodsReplyService.selectByGoodsReplyCheck(result.getGoodsLine().getGoods().getGoodsId(),users.getUserId());
			
			//System.out.println(goodsReplyCheck.size()+"000나와라");
			replyCheck.add(goodsReplyCheck.size());
			
			
			
			OrderLineDTO dto = new OrderLineDTO(result.getOrderLineId(), null, null, result.getOrderLineAmount(), result.getOrderLinePrice(), result.getOrderLineState());
			resultOrderLine.add(dto);
			
			GoodsLine goodsLine = goodsLineService.goodsLineSelect(result.getGoodsLine().getGoodsLineId());

			GoodsLineDTO goodsLineDto = new GoodsLineDTO(goodsLine.getGoodsLineId(), null, goodsLine.getGoodsLineAmount(), goodsLine.getGoodsLineDate());	

			resultGoodsLine.add(goodsLineDto);
		}
		for(GoodsLineDTO x : resultGoodsLine) {
			
			GoodsLine goodsLine = goodsLineService.goodsLineSelect(x.getGoodsLineId());
			
			Goods goods = goodsService.getGoodsByGoodsId(goodsLine.getGoods().getGoodsId());
			
			GoodsDTO goodsDTO = new GoodsDTO(goods.getGoodsId(), null, goods.getGoodsLocalCategory(), goods.getGoodsCategory(), goods.getGoodsName(), goods.getGoodsPrice(), goods.getGoodsContent(), goods.getGoodsPhoto(), goods.getGoodsAddr());
			resultGoods.add(goodsDTO);
		}
		
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;
		
		System.out.println("goods : "+resultGoods.size()+"| goodsLine : "+resultGoodsLine.size() +" | orderLine : "+resultOrderLine.size());
		
		/////상품후기 여부 
		
		
		map.put("replyCheck",replyCheck);
		map.put("totalPages", orderLine.getTotalPages());
		map.put("nowPage", nowPage);
		map.put("blockCount", BLOCK_COUNT);
		map.put("startPage", startPage);
		
		map.put("goods", resultGoods);
		map.put("goodsLine",resultGoodsLine);
		map.put("orderLine", resultOrderLine);
		
		return map;
	}
	
	
	/*
	 @RequestMapping("/reserveAll")
	@ResponseBody
	public Map<String, Object> myReserveSelect()  throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		List<Orders> order=ordersService.getOrdersByUserId(users.getUserId());
		List<Long> orderLineIdList = new  ArrayList<Long>();
		//jsonignore 해결하기위해 dto 설정
		
		List<OrderLineDTO> resultOrderLine = new ArrayList<OrderLineDTO>();
		
		List<GoodsLineDTO> resultGoodsLine = new ArrayList<GoodsLineDTO>();
		
		List<GoodsDTO> resultGoods	= new ArrayList<GoodsDTO>();
		
		
		for(Orders x : order) {
			
			for(OrderLine y : x.getOrdersLineList()) {
				orderLineIdList.add(y.getOrderLineId());
			}
		}		
		
		//내가 가지고있는 상품목록 뿌리기

		for(Long id : orderLineIdList ) {
			
			OrderLine result = orderLineService.selectById(id);
			
			OrderLineDTO dto = new OrderLineDTO(result.getOrderLineId(), null, null, result.getOrderLineAmount(), result.getOrderLinePrice(), result.getOrderLineState());
			resultOrderLine.add(dto);
			
			GoodsLine goodsLine = goodsLineService.goodsLineSelect(result.getGoodsLine().getGoodsLineId());

			GoodsLineDTO goodsLineDto = new GoodsLineDTO(goodsLine.getGoodsLineId(), null, goodsLine.getGoodsLineAmount(), goodsLine.getGoodsLineDate());	

			resultGoodsLine.add(goodsLineDto);
			
			
			

		}
		for(GoodsLineDTO x : resultGoodsLine) {
			System.out.println(x.getGoodsLineId());
			GoodsLine goodsLine = goodsLineService.goodsLineSelect(x.getGoodsLineId());
			
			Goods goods = goodsService.getGoodsByGoodsId(goodsLine.getGoods().getGoodsId());
			
			GoodsDTO goodsDTO = new GoodsDTO(goods.getGoodsId(), null, goods.getGoodsLocalCategory(), goods.getGoodsCategory(), goods.getGoodsName(), goods.getGoodsPrice(), goods.getGoodsContent(), goods.getGoodsPhoto(), goods.getGoodsAddr());
			resultGoods.add(goodsDTO);
		}
		
		
		
		System.out.println("goods : "+resultGoods.size()+"| goodsLine : "+resultGoodsLine.size() +" | orderLine : "+resultOrderLine.size());
		
		map.put("goods", resultGoods);
		map.put("goodsLine",resultGoodsLine);
		map.put("orderLine", resultOrderLine);
		
		return map;
	}
	 * */
	
	
	
	
	
	@RequestMapping("/cancleOrder")
	public String cancleOrder(Long orderLineId) {
		orderLineService.deleteOrderLine(orderLineId);
		
		return "redirect:/user/myReserve";
	}
	
	@RequestMapping("/deleteOrder")
	@ResponseBody
	public String deleteOrder(Long orderLineId) {
		System.out.println(orderLineId);
		orderLineService.deleteOrder(orderLineId);
		
		return "ok";
	}
	
}
