package kosta.mvc.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.GoodsDTO;
import kosta.mvc.dto.GoodsLineDTO;
import kosta.mvc.dto.OrderDTO;
import kosta.mvc.dto.OrderLineDTO;
import kosta.mvc.service.GoodsLineService;
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
	public Map<String, Object> myReserveSelect() {
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

		}
		System.out.println("첫음 : "+resultOrderLine.size());
	
		for(OrderLineDTO x : resultOrderLine) {
			
			GoodsLine goodsLine = goodsLineService.goodsLineSelect(x.getOrderLineId());
			
			
			GoodsLineDTO goodsLineDto = new GoodsLineDTO(goodsLine.getGoodsLineId(), null, goodsLine.getGoodsLineAmount(), goodsLine.getGoodsLineDate());	
			resultGoodsLine.add(goodsLineDto);
			System.out.println(resultGoodsLine.size());
			
		}
		System.out.println("두음 : "+resultGoodsLine.size());
		for(GoodsLineDTO x : resultGoodsLine) {
			
			 GoodsDTO goodsDTO = new GoodsDTO(x.getGoods().getGoodsId(), null, x.getGoods().getGoodsLocalCategory(), x.getGoods().getGoodsCategory(), x.getGoods().getGoodsName(), x.getGoods().getGoodsPrice(), x.getGoods().getGoodsContent(), x.getGoods().getGoodsPhoto(), x.getGoods().getGoodsAddr());
			 resultGoods.add(goodsDTO);
		}
		
		
		
		System.out.println("goods : "+resultGoods.size()+"| goodsLine : "+resultGoodsLine.size() +" | orderLine : "+resultOrderLine.size() );
		map.put("goods", resultGoods);
		//map.put("goodsLine",resultGoodsLine);
		//map.put("orderLine", resultOrderLine);
		return map;
	}
	
}
