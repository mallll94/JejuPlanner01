package kosta.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Place;
import kosta.mvc.service.PlaceService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private PlaceService placeService;
	
	private final static int PAGE_COUNT=1;
	private final static int BLOCK_COUNT=4;

	@RequestMapping("/{url}")
	public void test() {}
	
	
	@RequestMapping("/all")
	@ResponseBody
	public Map<String, Object> selectAll(String cata,@RequestParam(defaultValue = "1")int nowPage) {
		System.out.println(nowPage);
		Map<String, Object> map = new HashMap<String, Object>();
		//페이징처리하기
		Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "placeId");
		Page<Place> pageList = placeService.selectAll(page);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;
		
		map.put("pageList", pageList);
		map.put("totalPages", pageList.getTotalPages());
		map.put("nowPage", nowPage);
		map.put("blockCount", BLOCK_COUNT);
		map.put("startPage", startPage);
		
		
		return map;
		
	}
	
	@RequestMapping("/selectBy")
	@ResponseBody
	public List<Place> selectByCata(String filter,String name,@RequestParam(defaultValue = "1")int nowPage) {//cata = non 인기순 이런거
		Map<String, Object> map = new HashMap<String, Object>();

		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;
		
		List<Place> list = placeService.selectByCata(filter, name,nowPage,PAGE_COUNT);
		
		map.put("pageList", list);
		//map.put("totalPages", list.getTotalPages());
		map.put("nowPage", nowPage);
		map.put("blockCount", BLOCK_COUNT);
		map.put("startPage", startPage);
		
		
		
		
		return list;
	}
	
	
	@RequestMapping("/typeName")
	@ResponseBody
	public List<Place> placeList(String filter,String name,@RequestParam(defaultValue = "1")int nowPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		return placeService.selectByCata(filter, name,nowPage,PAGE_COUNT);
	}
	
	
	
	
	@RequestMapping("/insert")
	public String insert(Place place) {
		//placeService.insertPlace(place);
		return "/admin/list";
	}
}
