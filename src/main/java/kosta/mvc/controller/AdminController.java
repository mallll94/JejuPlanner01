package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Place;
import kosta.mvc.service.PlaceService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private PlaceService placeService;
	

	@RequestMapping("/list")
	public void test() {}
	
	
	@RequestMapping("/all")
	@ResponseBody
	public List<Place> selectAll(String cata) {
		
		return placeService.selectAll();
		
	}
	
	@RequestMapping("/selectBy")
	@ResponseBody
	public List<Place> selectByCata(String filter,String name) {//cata = non 인기순 이런거
		System.out.println("filter : "+filter+" | name : "+name);
		List<Place> list = placeService.selectByCata(filter, name);
		return list;
	}
	
	
	@RequestMapping("/place")
	@ResponseBody
	public List<Place> placeList(String filter,String name) {
		System.out.println("filter : "+filter+" | name : "+name);
		return placeService.selectByCata(filter, name);
	}
	
	@RequestMapping("/home")
	@ResponseBody
	public List<Place> homeList(String filter,String name) {
		System.out.println("filter : "+filter+" | name : "+name);
		return placeService.selectByCata(filter, name);
	}
}
