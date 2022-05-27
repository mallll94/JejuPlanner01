package kosta.mvc;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.DiaryLineRepository;
import kosta.mvc.repository.DiaryRepository;
import kosta.mvc.repository.PlaceRepository;
import kosta.mvc.repository.PlannerPlaceRepository;
import kosta.mvc.repository.PlannerRepository;
import kosta.mvc.repository.UserRepository;

@SpringBootTest
@Transactional
@Commit
class JejuProjectApplicationTests {
	@Autowired
	private UserRepository userRep;
	@Autowired
	private PlaceRepository placeRep;
	@Autowired
	private PlannerRepository plannerRep;
	@Autowired
	private PlannerPlaceRepository plannerplaceRep;
	@Autowired
	private DiaryRepository diaryRep;
	@Autowired
	private DiaryLineRepository diarylineRep;

	@Test
	void contextLoads() {
		System.out.println("userRep " + userRep);
	}
	
	
	//주의 user는 id가 pk라서 등록일, 회원상태(default값 있는 경우)
		@Test
		void userinsert() {
			//userRep.save(new Users("aaa", "데이지", "1234", 01012341234, "aaa111@gmail.com", null, null, "F"));
			//userRep.save(new Users("bbb", "구름", "112233", 01011112222, "cloud@gmail.com", null, null, "M"));
			//userRep.save(new Users("abc123", "오월", "55555", 01055550000, "may55@gmail.com", null, null, "F"));
			
			placeRep.save(new Place(null, "장소", "성산일출봉", "제주 서귀포시 성산읍 성산리 1", "높이 180m. 제주특별자치도 동쪽에 돌출한 성산반도 끝머리에 있다. ", 
					null, "http://www.visitjeju.net","14130522.0387535", "3956372.5709820",  0));
		}
	

}




