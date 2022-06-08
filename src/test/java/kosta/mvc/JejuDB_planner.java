package kosta.mvc;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;


import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.PlanBoard;
import kosta.mvc.domain.PlanReply;
import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.domain.Users;

import kosta.mvc.repository.GoodsLineRepository;
import kosta.mvc.repository.GoodsRepository;
import kosta.mvc.repository.OrderLineRepository;
import kosta.mvc.repository.OrdersRepository;
import kosta.mvc.repository.PlaceRepository;
import kosta.mvc.repository.PlanBoardRepository;
import kosta.mvc.repository.PlanReplyRepository;
import kosta.mvc.repository.PlannerPlaceRepository;
import kosta.mvc.repository.PlannerRepository;
import kosta.mvc.repository.UserRepository;

@SpringBootTest
@Transactional
@Commit
public class JejuDB_planner {

	@Autowired
	private UserRepository userRep;
	@Autowired
	private PlaceRepository placeRep;
	@Autowired
	private PlannerRepository plannerRep;
	@Autowired
	private PlannerPlaceRepository plannerplaceRep;
	@Autowired
	private PlanBoardRepository planBRep;
	@Autowired
	private PlanReplyRepository planreplyRep;
	@Autowired
	private OrdersRepository orderRep;
	@Autowired
	private OrderLineRepository orderLineRep;
	
	@Autowired
	private GoodsRepository goodsRep;
	
	@Autowired
	private GoodsLineRepository goodsLineRep;
	
	
	
	//주의 user는 id가 pk라서 등록일, 회원상태(default값 있는 경우)
	@Test
	void userinsert() {
		//userRep.save(new Users("aaa", "데이지", "1234", 01012341234, "aaa111@gmail.com", null, null, "F"));
		//userRep.save(new Users("bbb", "구름", "112233", 01011112222, "cloud@gmail.com", null, null, "M"));
		//userRep.save(new Users("abc123", "오월", "55555", 01055550000, "may55@gmail.com", null, null, "F"));
		
		
	}
	/*
	@Test
	public void placeisert() {
		placeRep.save(new Place(null, "장소", "성산일출봉", "제주 서귀포시 성산읍 성산리 1", "높이 180m. 제주특별자치도 동쪽에 돌출한 성산반도 끝머리에 있다.", 
				null, "http://www.visitjeju.net","33.4587", "126.9425",  0));
		placeRep.save(new Place(null, "장소", "쇠소깍", "제주 서귀포시 쇠소깍로 104", "서귀포시 하효동과 남원읍 하례리 사이를 흐르는 효돈천(孝敦川) 하구를 가리키며, 이곳은 제주 현무암 지하를 흐르는 물이 분출하여 바닷물과 만나 깊은 웅덩이를 형성한 곳이다.", 
				null, "http://www.visitjeju.net","33.2543", "126.6223",  0));
		placeRep.save(new Place(null, "장소", "금능해수욕장", "제주 제주시 한림읍 금능리", "전통어로 체험이 가능한 은빛 해수욕장 개장기간 : 매년 7~8월 중 요금입장료 무료 주차가능대수: 94 대 시설 및 제공서비스 : 샤워실 탈의실 화장실 급수대", 
				null, "http://www.visitjeju.net","33.3903", "126.2357",  0));
		placeRep.save(new Place(null, "숙소", "제주 신라 호텔", "제주 서귀포시 중문관광로72번길 75", "제주 중문 관광 단지에 위치하고 있는 제주신라호텔은 사계절 휴양 리조트호텔입니다.", 
				null, "http://www.shilla.net/jeju/","33.2476", "126.408",  0));
		placeRep.save(new Place(null, "숙소", "그랜드 하얏트 제주", "제주 제주시 노연로 12 그랜드 하얏트 제주 | 제주 드림타워 복합리조트", "제주 도심에 위치한 제주 드림타워 복합 리조트는 제주 국제공항, 국제 크루즈 터미널에서 자동차로 10분 이내에 닿을 수 있는 거리에 있습니다.", 
				null, "https://www.hyatt.com/en-US/hotel/south-korea/grand-hyatt-jeju/cjugh","33.4853", "126.4814",  0));
		
	}*/
	/**플래너 등록*/
	//onetomany null처리
	/*
	@Test
	public void plannerinsert() {
		
		Users user1  = userRep.findById("aaa").orElse(null);
		LocalDate p1start = LocalDate.of(2021,8,02);
		LocalDate p1end = LocalDate.of(2021,8, 05);
		LocalDate p2start = LocalDate.of(2022,06,22);
		LocalDate p2end = LocalDate.of(2022, 06, 27);
		plannerRep.save(new Planner(null, user1, "제주도", null, 4, p1start, p1end, null,"제주도",null,null,null));
		plannerRep.save(new Planner(null, user1, "즐거운 여행~", "나홀로", 1,p2start, p2end, null,"제주도",null,null,null));
		
		Users user2  = userRep.findById("bbb").orElse(null);
		LocalDate p3start = LocalDate.of(2020,01,12);
		LocalDate p3end = LocalDate.of(2020, 01, 15);
		LocalDate p4start = LocalDate.of(2022,06,03);
		LocalDate p4end = LocalDate.of(2022, 06, 05);
		plannerRep.save(new Planner(null, user2, "제주도여행!", "연인",2, p3start, p3end, null,"제주도",null,null,null));
		plannerRep.save(new Planner(null, user2, "제주도", "친구", 3,p4start, p4end, null,"제주도",null,null,null));
		
		Users user3  = userRep.findById("abc123").orElse(null);
		LocalDate p5start = LocalDate.of(2020,01,12);
		LocalDate p5end = LocalDate.of(2020, 01, 15);
		plannerRep.save(new Planner(null, user3, "제주도", null, 1, p5start, p5end, null,"제주도",null,null,null));	
	}
	*/
	/**플래너 세부 내용 등록*/
	@Test
	public void plannerplaceinsert() {
		//planner,place id값 확인하기
		Place place1 = placeRep.findById(1L).orElse(null); //성산일출봉
		Place place2 = placeRep.findById(2L).orElse(null); //쇠소깍
		Place place3 = placeRep.findById(3L).orElse(null); //금능해수욕장
		Place place4 = placeRep.findById(4L).orElse(null); //제주신라호텔
		Place place5 = placeRep.findById(5L).orElse(null); //그랜드하얏트제주
		
		Users user1  = userRep.findById("aaa").orElse(null);
		Planner planner11 = plannerRep.findById(1L).orElse(null);
		plannerplaceRep.save(new PlannerPlace(null, user1, planner11, place1, 1,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user1, planner11, place4, 1,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user1, planner11, place2, 2,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user1, planner11, place4, 2,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user1, planner11, place3, 2,null, null,0,null,null,null));
		
		Planner planner12 = plannerRep.findById(2L).orElse(null);
		plannerplaceRep.save(new PlannerPlace(null, user1, planner12, place1, 1,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user1, planner12, place4, 1,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user1, planner12, place2, 1,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user1, planner12, place5, 2,null, null,0,null,null,null));
		
		Users user2  = userRep.findById("bbb").orElse(null);
		Planner planner21 = plannerRep.findById(3L).orElse(null);
		plannerplaceRep.save(new PlannerPlace(null, user2, planner21, place1, 1,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user2, planner21, place4, 1,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user2, planner21, place2, 2,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user2, planner21, place4, 2,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user2, planner21, place3, 2,null, null,0,null,null,null));
		
		Planner planner22 = plannerRep.findById(4L).orElse(null);
		plannerplaceRep.save(new PlannerPlace(null, user2, planner22, place3, 1,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user2, planner22, place5, 1,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user2, planner22, place2, 1,null, null,0,null,null,null));
		plannerplaceRep.save(new PlannerPlace(null, user2, planner22, place5, 2,null, null,0,null,null,null));
	}
	
	/**다이어리*/
	//onetomany null처리
	/*@Test
	public void diaryinsert() {
		Users user1  = userRep.findById("aaa").orElse(null);
		Users user2  = userRep.findById("bbb").orElse(null);
		Users user3  = userRep.findById("abc123").orElse(null);
		Planner planner11 = plannerRep.findById(1L).orElse(null);
		Planner planner12 = plannerRep.findById(2L).orElse(null);
		Planner planner21 = plannerRep.findById(3L).orElse(null);
		Planner planner22 = plannerRep.findById(4L).orElse(null);
		Planner planner31 = plannerRep.findById(5L).orElse(null);
		//diaryRep.save(new Diary(null, user1, planner11, null, planner11.getPlannerName(), planner11.getPlannerType(), planner11.getPlannerCount()));
		//diaryRep.save(new Diary(null, user1, planner12, null, planner12.getPlannerName(), planner12.getPlannerType(), planner12.getPlannerCount()));
		//diaryRep.save(new Diary(null, user2, planner21, null, planner21.getPlannerName(), planner21.getPlannerType(), planner21.getPlannerCount()));
		//diaryRep.save(new Diary(null, user2, planner22, null, planner22.getPlannerName(), planner22.getPlannerType(), planner22.getPlannerCount()));
		//diaryRep.save(new Diary(null, user3, planner31, null, planner31.getPlannerName(), null, planner31.getPlannerCount()));
	}*/
	
	/**다이어리 내용*/
	/*@Test
	public void diarylineinsert() {
		
		Diary diary1 = diaryRep.findById(1L).orElse(null);
		Diary diary2 = diaryRep.findById(2L).orElse(null);
		Diary diary3 = diaryRep.findById(3L).orElse(null);
		Diary diary4 = diaryRep.findById(4L).orElse(null);
		Diary diary5 = diaryRep.findById(5L).orElse(null);
		PlannerPlace pp1 = plannerplaceRep.findById(1L).orElse(null);
		PlannerPlace pp2 = plannerplaceRep.findById(2L).orElse(null);
		PlannerPlace pp3 = plannerplaceRep.findById(3L).orElse(null);
		PlannerPlace pp4 = plannerplaceRep.findById(4L).orElse(null);
		
		//diarylineRep.save(new DiaryLine(null, diary1, pp1, "신나는 여행~", null, 10000));
		//diarylineRep.save(new DiaryLine(null, diary1, pp2, "신나는 여행~", null, 210000));
		//diarylineRep.save(new DiaryLine(null, diary1, pp3, "신나는 여행~", null, 52000));
		//diarylineRep.save(new DiaryLine(null, diary1, pp4, "신나는 여행~", null, 210000));
	}*/
	
	/*@Test
	public void selectBydiaryId() {
		List<DiaryLine> dlist =diarylineRep.findAllByDiary(1L);
		System.out.println("dlistSize = " + dlist.size());
		for (DiaryLine dl : dlist) {
			PlannerPlace pp = dl.getPlannerPlace();
			System.out.println("plannerPlaceId" + pp.getPlannerPlaceId());
			System.out.println("PlaceId" + pp.getPlace().getPlaceName());
			System.out.println("======================================================================================");
		}
	}*/
	
	
	/**플래너 공유게시판*/
	//onetomany null처리
	@Test
	public void plannerBinsert() {
		Users user1  = userRep.findById("aaa").orElse(null);
		Users user2  = userRep.findById("bbb").orElse(null);
		Users user3  = userRep.findById("abc123").orElse(null);
		Planner planner11 = plannerRep.findById(1L).orElse(null);
		Planner planner12 = plannerRep.findById(2L).orElse(null);
		Planner planner21 = plannerRep.findById(3L).orElse(null);
		Planner planner22 = plannerRep.findById(4L).orElse(null);
		Planner planner31 = plannerRep.findById(5L).orElse(null);
		
		planBRep.save(new PlanBoard(null, planner11, user1, planner11.getPlannerType(), "여행공유합니다~", "어떤가요~....", null, null,null));
		planBRep.save(new PlanBoard(null, planner21, user2, planner21.getPlannerType(), "이런 제주여행", "즐거웠습니다^^", null, null,null));
		
	}
	
	/**플래너 공유게시판 댓글*/
	@Test
	public void plannerBreplyinsert() {
		Users user1  = userRep.findById("aaa").orElse(null);
		Users user2  = userRep.findById("bbb").orElse(null);
		Users user3  = userRep.findById("abc123").orElse(null);
		PlanBoard pboard1 = planBRep.findById(1L).orElse(null);
		PlanBoard pboard2 = planBRep.findById(2L).orElse(null);
		
		planreplyRep.save(new PlanReply(null, pboard1,  user2,"우와", null));
		planreplyRep.save(new PlanReply(null, pboard1,  user2, "제주도 여행 좋아요~", null));
		planreplyRep.save(new PlanReply(null, pboard1,  user3, "참고할게요^^", null));
	}
	
	
	
	/**
	 * 주문하기 
	 * */
	@Test
	public void orderInsert() {
		Users user1  = userRep.findById("aaa").orElse(null);
		Users user2  = userRep.findById("bbb").orElse(null);
		Users user3  = userRep.findById("abc123").orElse(null);
		
		orderRep.save(new Orders(null, user1, "카드", 30000, user1.getUserName(), user1.getUserEmail(), user1.getUserPhone(), "픽업요청합니다.", null));
		orderRep.save(new Orders(null, user2, "카카오페이", 45000, user2.getUserName(), user2.getUserEmail(), user2.getUserPhone(), null, null));
		orderRep.save(new Orders(null, user3, "계좌이체", 5500, user3.getUserName(), user3.getUserEmail(), user3.getUserPhone(), "연락주세요", null));
		
	}
	
	



	/**
	 * 주문상세 
	 * */
	@Test
	public void orderLineInsert() {
		Users user1  = userRep.findById("aaa").orElse(null);
		Users user2  = userRep.findById("bbb").orElse(null);
		Users user3  = userRep.findById("abc123").orElse(null);
		
		Orders orders1 = orderRep.findById(4L).orElse(null);
		Orders orders2 = orderRep.findById(5L).orElse(null);
		Orders orders3 = orderRep.findById(6L).orElse(null);
		
		GoodsLine goodsLine1 = goodsLineRep.findById(1L).orElse(null);
		GoodsLine goodsLine2 = goodsLineRep.findById(2L).orElse(null);
		GoodsLine goodsLine3 = goodsLineRep.findById(3L).orElse(null);
		
		orderLineRep.save(new OrderLine(null, orders1, goodsLine1, 4, 20000, "BU"));
		orderLineRep.save(new OrderLine(null, orders2, goodsLine2, 4, 20000, "CU"));
		orderLineRep.save(new OrderLine(null, orders3, goodsLine3, 4, 20000, "EX"));
	}
	
	
}
