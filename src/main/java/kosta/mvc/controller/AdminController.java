package kosta.mvc.controller;

import java.io.File;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kosta.mvc.domain.Place;
import kosta.mvc.service.PlaceService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	
	private final PlaceService placeService;
	
	private final static int PAGE_COUNT=2;
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
	
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage =nowPage-temp;
		
		map.put("pageList", pageList);
		map.put("totalPages", pageList.getTotalPages());
		map.put("nowPage", nowPage);
		map.put("blockCount", BLOCK_COUNT);
		map.put("startPage", startPage);
		
		
		return map;
		
	}

	
	@RequestMapping("/placeInsert")
	public String insert(Place place, HttpSession session){
		System.out.println("dd");
		/*
		MultipartFile mfile = place.getFile();
		System.out.println(mfile.getOriginalFilename());
		String path = session.getServletContext().getRealPath("/WEB-INF/img");
		if(mfile.getSize()>0) {//첨부된 파일에 용량이 있따면
			try {
				mfile.transferTo(new File(path+"/"+mfile.getOriginalFilename()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			place.setPlacePhoto(mfile.getOriginalFilename());
			
		}
		*/
		
		placeService.insertPlace(place);
		
		
		return "admin/list";
	}
	
	@RequestMapping("/modalSelect")
	@ResponseBody
	public Place insert(String name) {
		Optional<Place> optional =placeService.selectByName(name);	
		Place result = optional.orElse(null);
		
		return result;
	}
	
	@RequestMapping("/placeUpdate")
	public String update(Place place) {
		System.out.println(place.getPlaceId());
		placeService.updatePlace(place);
		
		return "admin/list";
	}
	
	@RequestMapping("/placeDelete")
	public String delete(Place place) {
		
		placeService.deletePlace(place.getPlaceId());
		return "admin/list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
