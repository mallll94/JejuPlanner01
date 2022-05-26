package kosta.mvc;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import kosta.mvc.domain.Users;
import kosta.mvc.repository.DiaryLineRepository;
import kosta.mvc.repository.DiaryRepository;
import kosta.mvc.repository.PlaceRepository;
import kosta.mvc.repository.PlannerPlaceRepository;
import kosta.mvc.repository.PlannerRepository;
import kosta.mvc.repository.UserRepository;
import lombok.RequiredArgsConstructor;

@SpringBootTest
@Transactional
@Commit
@RequiredArgsConstructor
class JejuDbApplicationTests {

	@Autowired
	private UserRepository userRep;
	
	private final PlaceRepository placeRep;
	private final PlannerRepository plannerRep;
	private final PlannerPlaceRepository plannerplaceRep;
	private final DiaryRepository diaryRep;
	private final DiaryLineRepository diarylineRep;
	
	
	
	//주의 user는 id가 pk라서 등록일, 회원상태(default값 있는 경우)
	/*@Test
	void userinsert() {
		userRep.save(new Users("aaa", "데이지", "1234", 01012341234, "aaa111@gmail.com", null, null, "F"));
		userRep.save(new Users("bbb", "구름", "112233", 01011112222, "cloud@gmail.com", null, null, "M"));
		userRep.save(new Users("abc123", "오월", "55555", 01055550000, "may55@gmail.com", null, null, "F"));
	}*/
	
	@PersistenceContext
	EntityManager em;
	
	@Test
	public void insert() {
		
		
		//1. save이용
		//userRep.save(new Users("abcdsfsd", "문제", "55555", 01055550000, "may55@gmail.com", null, null, "F"));
		/*
		placeRep.save(new Place(null, "장소", "성산일출봉", "제주 서귀포시 성산읍 성산리 1", "높이 180m. 제주특별자치도 동쪽에 돌출한 성산반도 끝머리에 있다. 중기 홍적세 때 분출된 화산인 성산 봉은 커다란 사발모양의 평평한 분화구가 섬 전체에 걸쳐 있다. 3면이 깎아지른 듯한 해식애를 이루며, 분화구 위는 99개의 바위 봉우리가 빙 둘러 서 있다.", 
				null, "http://www.visitjeju.net","14130522.0387535", "3956372.5709820",  0));
		*/
		
		//2. 수정이용
		/*
		Place np = new Place();
		np.setPlaceCategory("장소"); np.setPlaceName("성산일출봉");
		np.setPlaceAddr("제주 서귀포시 성산읍 성산리 1");
		*/
		
		//3. EntityManager 이용
		/*
		em.persist(new Place(null, "장소", "성산일출봉", "제주 서귀포시 성산읍 성산리 1",
		  "높이 180m. 제주특별자치도 동쪽에 돌출한 성산반도 끝머리에 있다. 중기 홍적세 때 분출된 화산인 성산 봉은 커다란 사발모양의 평평한 분화구가 섬 전체에 걸쳐 있다. 3면이 깎아지른 듯한 해식애를 이루며, 분화구 위는 99개의 바위 봉우리가 빙 둘러 서 있다."
		  , null, "http://www.visitjeju.net","14130522.0387535", "3956372.5709820", 0));
		 */
		 
		
	
	}
	
	
	
	
	
	
	

}
