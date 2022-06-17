                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           package kosta.mvc.controller;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.PlannerPlaceDTO;
import kosta.mvc.service.GoodsService;
import kosta.mvc.service.PlaceService;
import kosta.mvc.service.PlannerService;
import kosta.mvc.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/planner")
@RequiredArgsConstructor
public class PlannerCreateController {

	private final PlannerService plannerService;
	private final PlaceService placeService;
	private final GoodsService goodsService;
	
	
	private final static int INDEX_PAGE_COUNT=4;
	private final static int INDEX_BLOCK_COUNT=3;
	private final static int PLACE_PAGE_COUNT=10;
	private final static int PLACE_BLOCK_COUNT=1;
	
	@RequestMapping("/{url}")
	public void init() {
		
	}
	
	/**플래너 전체조회하기*/
	@RequestMapping("/plannerIndex")
	public void selectAllByUserID(Model model, HttpSession session, @RequestParam(defaultValue = "1") int nowPage){
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		//여행시작일 오름차순
		Pageable pageable = PageRequest.of((nowPage-1), INDEX_PAGE_COUNT, Direction.ASC, "plannerStart");
		Page<Planner> pagelist = plannerService.selectAllByUserIdPageing(pageable,users.getUserId());
		List<Planner> plist = pagelist.getContent();
		List<Goods>	plannerGoods = goodsService.getAllGoodsByPlanner(users);
		
		int temp = (nowPage-1)%INDEX_BLOCK_COUNT;
		int startPage =nowPage-temp;
		
		model.addAttribute("loginUser", users);
		model.addAttribute("pageList", pagelist);
		model.addAttribute("plannerList",plist);
		model.addAttribute("blockCount",INDEX_BLOCK_COUNT);
		model.addAttribute("startPage",startPage);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("plannerGoods", plannerGoods);
	}
	/**
	 * 플래너 추천상품 보여주기
	 */
//	@GetMapping("/plannerIndex")
//	public ModelAndView getGoodsListViewPlannerCategory(Model model) {
//		//플래너상
//		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		List<Goods>	plannerGoods = goodsService.getAllGoodsByPlanner(users);
//		model.addAttribute("plannerGoods", plannerGoods);
//		return new ModelAndView("planner/plannerIndex");
//	}
	
	
	/**플래너 작성하기1로 이동*/
	@RequestMapping("/plannerWrite")
	public String wirteForm(Long plannerId, Model model, HttpSession session) {

		if(plannerId!=null) {
			Planner planner = plannerService.selectBy(plannerId);
			model.addAttribute("planner", planner);
		}
		return "planner/plannerWrite";
	}
	
	/**플래너 상세 조회하기*/
	@RequestMapping("/selectByUserId")
	@ResponseBody
	public String selectBy(Long plannerId) {
		Planner dbplanner =plannerService.selectBy(plannerId);
		String result =Long.toString(dbplanner.getPlannerId());
		return result;
	}
	
	/**planner place 조회*/
	@RequestMapping("/selectPlannerPlace")
	@ResponseBody
	public Map<String, Object> selectPlannerPlace(Long plannerId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//D-day
		Planner dbplanner =plannerService.selectBy(plannerId);
		Period period = Period.between(dbplanner.getPlannerStart(), dbplanner.getPlannerEnd());
		
		List<PlannerPlaceDTO> plist = plannerService.selectPlaceByPlanner(plannerId);

		map.put("Dday", period.getDays());
		map.put("plist", plist);
		return map;
	}
	
	
	
	/**기존플래너 날짜 수정*/
	@RequestMapping("updateDate")
	@ResponseBody
	public int updateDate(Long plannerId,String plannerStart,String plannerEnd){
		//Map<String, Object> map = new HashMap<String, Object>();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDate = LocalDate.parse(plannerStart,format);
		LocalDate endDate = LocalDate.parse(plannerEnd,format);
		
		Planner planner =plannerService.selectBy(plannerId);
			planner.setPlannerStart(startDate);
			planner.setPlannerEnd(endDate);
		plannerService.updatePlanStartdateAndEnddate(planner);
		System.out.println(" === updateDate plannerStart"+plannerStart);
		//D-day
		Period period = Period.between(planner.getPlannerStart(), planner.getPlannerEnd());

		return period.getDays();
	}
	
	/**새로운 플래너 생성하기*/ //service에서 다이어리도 생성해야함
	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, Object> insert(String plannerStart,String plannerEnd, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDate = LocalDate.parse(plannerStart,format);
		LocalDate endDate = LocalDate.parse(plannerEnd,format);
			System.out.println(" === plannerInsert startDay = "+startDate);
		Planner newplanner = new Planner(users);
			newplanner.setPlannerStart(startDate);
			newplanner.setPlannerEnd(endDate);
		plannerService.insertPlan(newplanner);
		
		//D-day
		Period period = Period.between(newplanner.getPlannerStart(), newplanner.getPlannerEnd());
		List<PlannerPlace> placelist= newplanner.getPlannerPlaceList();
		map.put("planner", newplanner);
		map.put("Dday", period.getDays());
		map.put("plannerPlace", placelist);
		
		return map;
		
	}
	
	/**왼쪽사이드바 일정 Day변경하기*/
	@RequestMapping("/updatePlanPlace")
	@ResponseBody
	public void updatePlanPlace(Long plannerplaceId, String date) {
		plannerService.updatePlanPlace(new PlannerPlace(plannerplaceId, null, null, null, Integer.parseInt(date), null, null, 0, null, null, null));
		
	}
	
	/**왼쪽사이드바 일정 삭제하기*/
	@RequestMapping("/deletePlan")
	@ResponseBody
	public void deletePlan(Long plannerplaceId) {
		plannerService.deletePlanPlace(plannerplaceId);
	}
	
	/**오른쪽 사이드바 장소정보 조회*/
	@RequestMapping("/selectPlace")
	@ResponseBody
	public Place selectPlace(Long placeId) {
		Place place =placeService.selectById(placeId);
		return place;
	}
	
	/**오른쪽 사이드바에서 장소추가하기버튼 >> 장소 아이디로 장소 검색하기*/
	@RequestMapping("/addPlace")
	@ResponseBody
	public Place addPlace(Long plannerId, Long placeId, String inputDate, HttpSession session) {
		Planner dbplanner = plannerService.selectBy(plannerId);
		Place dbplace =placeService.selectById(placeId);
		int  plannerPlaceDate = Integer.parseInt(inputDate);
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		plannerService.insertPlanPlace(new PlannerPlace(null, users, dbplanner, dbplace, plannerPlaceDate, null, null, 0, null, null, null));
		return dbplace;
	}
	

	/**오른쪽 사이드바에서 카테고리별 추천받기*/
	@RequestMapping("/recommend")
	@ResponseBody
	public List<Place> recommendCategory(String category) {
		Page<Place> dblist =placeService.selectByCata("placeSave", category,1,PLACE_PAGE_COUNT);
		List<Place> plist = dblist.getContent();
		return plist;
	}

	/**오른쪽 사이드바 검색하기*/
	@RequestMapping("/searchPlace")
	@ResponseBody
	public Map<String, Object> searchPlace(String keyword, @RequestParam(defaultValue = "1")int nowPage){
		Map<String, Object> map = new HashMap<String, Object>();
		Pageable pageable = PageRequest.of((nowPage-1), PLACE_PAGE_COUNT, Direction.DESC, "placeSave");
		Page<Place> pList =placeService.selectByKeyword(pageable,keyword);
		List<Place> pageList = pList.getContent();
		
		
		int temp =(nowPage-1)%PLACE_BLOCK_COUNT;
		int startPage = nowPage-temp;
		
		map.put("pageList", pageList);
		map.put("totalPages", pList.getTotalPages());
		map.put("blockCount", PLACE_BLOCK_COUNT);
		map.put("startPage", startPage);
		map.put("nowPage", nowPage);
		
		return map;
	}
	

	
}
