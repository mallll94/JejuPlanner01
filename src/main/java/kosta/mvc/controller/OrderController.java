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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.Users;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	
	
	@RequestMapping("/{url}")
	public void init() {}
	
	@RequestMapping("select")
	@ResponseBody
	public Map<String, Object> selectAll(){
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("user", users);
		return map;
	}

	@RequestMapping("/kakao")
	@ResponseBody
	public String kakaoPay() {
		
		try {
			URL kko = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con = (HttpURLConnection) kko.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK 1de96fc9ad0a9647904156985b067816");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			
			String para = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=제주잇다&quantity=1&total_amount=100&vat_amount=10&tax_free_amount=0&approval_url=http://localhost:8888/admin/list&fail_url=http://localhost:8888/goods/test&cancel_url=http://localhost:8888/";
			OutputStream out = con.getOutputStream();
			
			DataOutputStream dataSend = new DataOutputStream(out);
			
			dataSend.writeBytes(para);
			
			dataSend.close();
			
			int result = con.getResponseCode();
			
			InputStream giveData;
			if(result==200) {//정상 그외 에러
				giveData = con.getInputStream();
				
			}else {
				giveData = con.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(giveData);
			BufferedReader bufferedReader =new BufferedReader(reader); //형변환 하는애
			System.out.println("11");
			return bufferedReader.readLine();
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "ddd";
	}
}
