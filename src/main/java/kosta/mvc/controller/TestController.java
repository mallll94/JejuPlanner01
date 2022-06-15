package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/test")
	public String index() {
		System.out.println("test...............");
		return "index";
	}
	
   @RequestMapping("/adminTest")
   public String adminTest() {
	   return "Admin_Main";
   }
      
   @RequestMapping("/success")
   public String success() {
	   return "order/success";
   }
}
