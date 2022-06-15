package kosta.mvc.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.Orders;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.GoodsDTO;
import kosta.mvc.dto.GoodsLineDTO;
import kosta.mvc.service.CartService;
import kosta.mvc.service.GoodsLineService;
import kosta.mvc.service.GoodsService;
import kosta.mvc.service.OrdersService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/order")
@RequiredArgsConstructor
public class OrderController {
	
	private final CartService cartService;
	
	private final GoodsService goodsService;
	
	private final GoodsLineService goodsLineService;
	
	private final OrdersService ordersService;
	
	@RequestMapping("/{url}")
	public void init() {}
	
	@RequestMapping("select")
	@ResponseBody
	public Map<String, Object> selectAll(Long [] goods){
		
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<GoodsDTO> goodsDTOs = new ArrayList<GoodsDTO>();
		List<GoodsLineDTO> goodsLineDTOs = new ArrayList<GoodsLineDTO>();
		List<GoodsLine> list = null;
		
		if(goods.length!=1) {
			list =cartService.selectByCartId(goods);
			
			for(GoodsLine x : list ) {
				GoodsLineDTO dto = new GoodsLineDTO(x.getGoodsLineId(), null, x.getGoodsLineAmount(), x.getGoodsLineDate());
				goodsLineDTOs.add(dto);
				
				GoodsDTO dto2 = new GoodsDTO(x.getGoods().getGoodsId(), null, null, null, x.getGoods().getGoodsName(), x.getGoods().getGoodsPrice(), x.getGoods().getGoodsContent(), x.getGoods().getGoodsPhoto(), x.getGoods().getGoodsAddr());
				goodsDTOs.add(dto2);
			}
		}else {
			
			
			GoodsLine goodsLine=goodsLineService.goodsLineSelect(goods[0]);
			
			
			
			goodsLineDTOs.add(new GoodsLineDTO(goodsLine.getGoodsLineId(), null, goodsLine.getGoodsLineAmount(), goodsLine.getGoodsLineDate()));
				
			goodsDTOs.add(new GoodsDTO(goodsLine.getGoods().getGoodsId(), null, null, null, goodsLine.getGoods().getGoodsName(), goodsLine.getGoods().getGoodsPrice(), goodsLine.getGoods().getGoodsContent(), goodsLine.getGoods().getGoodsPhoto(), goodsLine.getGoods().getGoodsAddr()));
			
		}
		
		map.put("goodsLine" , goodsLineDTOs);
		map.put("goods" , goodsDTOs);
		map.put("user", users);
		return map;
	}

	@RequestMapping("/kakao")
	@ResponseBody
	public String kakaoPay(Long [] goods, String name, String email, String phone, int totalPrice,String text ) {
			String id =null;
			Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			List<GoodsLine> list =new ArrayList<GoodsLine>();;
			
			if(goods.length!=1) {
				list =cartService.selectByCartId(goods);

			}else {
				
				GoodsLine goodsLine=goodsLineService.goodsLineSelect(goods[0]);
				list.add(goodsLine);
			}
			
			
			
			
			
		try {

			
			URL kko = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con = (HttpURLConnection) kko.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK 1de96fc9ad0a9647904156985b067816");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);

			String para = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=제주잇다&quantity=1&total_amount=30000&vat_amount=10&tax_free_amount=0&approval_url=http://localhost:8888/order/success&fail_url=http://localhost:8888/order/fail&cancel_url=http://localhost:8888/";
			OutputStream out = con.getOutputStream();

			DataOutputStream dataSend = new DataOutputStream(out);

			dataSend.writeBytes(para);
		
			dataSend.close();
			
			int result = con.getResponseCode();
		
			InputStream giveData;
			
			if(result==200) {//정상 그외 에러
				giveData = con.getInputStream();
				
				Long orderId=ordersService.addOrders(list, name, email, phone, totalPrice, users, text,"카카오페이");
				id = orderId.toString();
				if(goods.length!=1) {
					for(Long i : goods) {
						cartService.deleteCart(i);
					}
				}
				

			}else {
				giveData = con.getErrorStream();

			}
			InputStreamReader reader = new InputStreamReader(giveData);
			BufferedReader bufferedReader =new BufferedReader(reader); //형변환 하는애
			System.out.println("11");
			return bufferedReader.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	@RequestMapping("bankBook")
	@ResponseBody
	public List<String> bankBook(Long [] goods, String name, String email, String phone, int totalPrice,String text ){
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<GoodsLine> list =cartService.selectByCartId(goods);
		System.out.println("Dsds");
		Long id=ordersService.addOrders(list, name, email, phone, totalPrice, users, text,"계좌이체");
		for(Long i : goods) {
			cartService.deleteCart(i);
		}
		String i = (int) (Math.random()*100000*100000000)+"";
		List<String> result = new ArrayList<String>();
		result.add(i);
		result.add(id+"");
		
		return result;
	}
	
	
	@RequestMapping("/detailOrder")
	public String goodsOrder(Long goodsId, String cartQty, String goodsLineDate,Model model) throws Exception{	
		int amountResult = Integer.parseInt(cartQty);
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDate = LocalDate.parse(goodsLineDate,format);
		
		
		Goods goods= goodsService.getGoodsByGoodsId(goodsId);
		GoodsLine goodsLine = new GoodsLine(null, goods, amountResult	, startDate);
		
		model.addAttribute("goods", goodsLineService.goodsLineCart(goodsLine).getGoodsLineId());
		

		return "order/order";
	}
	
	
	@RequestMapping("/orderId")
	@ResponseBody
	public List<Orders> okOrderId(){
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Orders> list=ordersService.OrdersByOkUserId(users.getUserId());
		return list;
	}
}
