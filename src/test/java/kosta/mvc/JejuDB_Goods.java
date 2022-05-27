package kosta.mvc;

import java.time.LocalDate;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.GoodsLineRepository;
import kosta.mvc.repository.GoodsReplyRepository;
import kosta.mvc.repository.GoodsRepository;
import kosta.mvc.repository.PlaceRepository;
import kosta.mvc.repository.UserRepository;

@SpringBootTest
@Transactional
@Commit
public class JejuDB_Goods {

	@Autowired
	private UserRepository userRep;
	@Autowired
	private PlaceRepository placeRep;
	@Autowired
	private GoodsRepository goodsRep;
	@Autowired
	private GoodsLineRepository goodsLineRep;
	@Autowired
	private GoodsReplyRepository goodsReplyRep;
	
	/**상품 등록*/
	//@OneToMany 주석처리하기
	@Test
	public void goodsinsert() {
		Users user1  = userRep.findById("aaa").orElse(null);
		Users user2  = userRep.findById("bbb").orElse(null);
		Users user3  = userRep.findById("abc123").orElse(null);
		Place place1 = placeRep.findById(1L).orElse(null); //성산일출봉
		Place place2 = placeRep.findById(2L).orElse(null); //쇠소깍
		Place place3 = placeRep.findById(3L).orElse(null); //금능해수욕장
		Place place4 = placeRep.findById(4L).orElse(null); //제주신라호텔
		Place place5 = placeRep.findById(5L).orElse(null); //그랜드하얏트제주
		goodsRep.save(new Goods(null, place1, "성산/우도", "액티비티", "제주레일바이크 이용권", 15000, "푸른 제주도 자연을 느껴보세요~!", null, "제주특별자치도 제주시 구좌읍 용눈이오름로 641"));
		goodsRep.save(new Goods(null, place2, "제주시", "액티비티", "쇠소깍 배낚시 캡틴호 주간 체험 배낚시 3시간", 28500, "제주도의 푸른 바다에서 친구, 가족, 연인과 함께 아름다운 추억을 만들어 보세요!", null, "제주특별자치도 서귀포시 효돈동 쇠소깍로 138"));
		goodsRep.save(new Goods(null, place3, "애월", "대여", "파라솔 캠핑&피크닉팩/24시간 대여", 33000, "2인 기준 1세트 가격입니다.⛱", null, "욜로올레제주 (제주특별자치도 제주시 애월읍 하가리 1407-3)"));
	}
	
	/**상품 상세*/
	@Test
	public void goodsLineinsert() {
		Goods goods1 = goodsRep.findById(1L).orElse(null);
		Goods goods2 = goodsRep.findById(2L).orElse(null);
		Goods goods3 = goodsRep.findById(3L).orElse(null);
		LocalDate date1 = LocalDate.of(2022,06,01);
		LocalDate date2 = LocalDate.of(2022,06, 02);
		LocalDate date3 = LocalDate.of(2022,06,03);
		LocalDate date4 = LocalDate.of(2022,06, 04);
		goodsLineRep.save(new GoodsLine(null, goods1, 30, date1));
		goodsLineRep.save(new GoodsLine(null, goods1, 30, date2));
		goodsLineRep.save(new GoodsLine(null, goods1, 30, date3));
		goodsLineRep.save(new GoodsLine(null, goods1, 30, date4));
		
		goodsLineRep.save(new GoodsLine(null, goods2, 10, date1));
		goodsLineRep.save(new GoodsLine(null, goods2, 10, date2));
		goodsLineRep.save(new GoodsLine(null, goods2, 10, date3));
		goodsLineRep.save(new GoodsLine(null, goods2, 10, date4));
		
		goodsLineRep.save(new GoodsLine(null, goods3, 10, date1));
		goodsLineRep.save(new GoodsLine(null, goods3, 10, date2));
		goodsLineRep.save(new GoodsLine(null, goods3, 10, date3));
		goodsLineRep.save(new GoodsLine(null, goods3, 10, date4));
		
	}
}
