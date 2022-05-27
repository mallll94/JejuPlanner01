package kosta.mvc;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import kosta.mvc.domain.AskBoard;
import kosta.mvc.domain.AskReply;
import kosta.mvc.domain.ChatBoard;
import kosta.mvc.domain.CrewBoard;
import kosta.mvc.domain.FreeBoard;
import kosta.mvc.domain.FreeReply;
import kosta.mvc.domain.Notice;
import kosta.mvc.domain.Orders;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.TimeDeal;
import kosta.mvc.domain.TimeOrderLine;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.AskBoardRepository;
import kosta.mvc.repository.AskReplyRepository;
import kosta.mvc.repository.ChatBoardRepository;
import kosta.mvc.repository.CrewBoardRepository;
import kosta.mvc.repository.DiaryLineRepository;
import kosta.mvc.repository.DiaryRepository;
import kosta.mvc.repository.FreeBoardRepository;
import kosta.mvc.repository.FreeReplyRepository;
import kosta.mvc.repository.NotiecRepository;
import kosta.mvc.repository.PlaceRepository;
import kosta.mvc.repository.PlannerPlaceRepository;
import kosta.mvc.repository.PlannerRepository;
import kosta.mvc.repository.TimeDealRepository;
import kosta.mvc.repository.TimeOrderLineRepository;
import kosta.mvc.repository.UserRepository;
import net.bytebuddy.asm.Advice.Local;

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
	@Autowired
	private NotiecRepository noticeRep;
	@Autowired
	private FreeBoardRepository freeboardRep;
	@Autowired
	private FreeReplyRepository freereplyRep;
	@Autowired
	private AskBoardRepository askboardRep;
	@Autowired
	private AskReplyRepository askreplyRep;
	@Autowired
	private CrewBoardRepository crewboardRep;
	@Autowired
	private ChatBoardRepository chatboardRep;
	@Autowired
	private TimeDealRepository timedealRep;
	@Autowired
	private TimeOrderLineRepository timeorderlineRep;

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
			//userRep.save(new Users("ccc", "데이지", "1234", 01012341234, "1111@gmail.com", null, null, "F"));
			//userRep.save(new Users("ddd", "구름", "112233", 01011112222, "2222@gmail.com", null, null, "M"));
			//userRep.save(new Users("eee", "오월", "55555", 01055550000, "3333@gmail.com", null, null, "F"));
			userRep.save(new Users("admin", "관리자", "admin", 000000000000, "Jeju@gmail.com", null, null, "admin"));
			
			/* placeRep.save(new Place(null, "장소", "성산일출봉", "제주 서귀포시 성산읍 성산리 1", "높이 180m. 제주특별자치도 동쪽에 돌출한 성산반도 끝머리에 있다. ", 
					null, "http://www.visitjeju.net","14130522.0387535", "3956372.5709820",  0)); */
		
		    //noticeRep.save(new Notice(null, "제목", "내용", null, "사진") );
			
		}
		
		/**자유게시판*/
		@Test
		void freeboardinsert() {
			Users user1 = userRep.findById("ccc").orElse(null);
			Users user2 =  userRep.findById("ddd").orElse(null);
			freeboardRep.save(new FreeBoard(null, user1, "장소추천", "새별오름 추천해요", "추천합니다", "사진", 0, null, null) );
			freeboardRep.save(new FreeBoard(null, user2, "여행추천", "오랜만에 제주도 다녀왔어요", "바다도 보고 오랜만에 좋았습니다", "사진", 0, null, null) );
			
		}
		
		/**자유게시판 댓글*/
		@Test
		void freereplyinsert() {
			
			Users user1 = userRep.findById("ddd").orElse(null);
			FreeBoard board1 = freeboardRep.findById(2L).orElse(null);
			freereplyRep.save(new FreeReply(null, board1, user1, "사진이 이뻐요", null) );
		}
	
	    /**1:1문의*/
		@Test
		void askboardinsert() {
			Users user1 = userRep.findById("ccc").orElse(null);
			askboardRep.save(new AskBoard(null, user1, "회원가입", "문의드립니다", "회원 수정 시 오류가 떠서 문의드립니다", "사진", "N", null) );
		}
		
		/**1:1문의 댓글*/
		@Test
		void askreplyinsert() {
			AskBoard board1 = askboardRep.findById(3L).orElse(null);
			askreplyRep.save(new AskReply(null, board1, "문의주신 사항확인하였습니다. 연락드리겠습니다.", null) );
					
		}
		
		/**동행구하기*/
		@Test
		void crewboardinsert() {
			Users user1 = userRep.findById("ccc").orElse(null);
			crewboardRep.save(new CrewBoard(null, user1, "동행구합니다", "6월달에 제주도 가실 분 구해요!", "N", null, null) );
		}
		
		/**동행구하기-채팅*/
		@Test
		void chatboardinsert() {
			Users user1 = userRep.findById("ccc").orElse(null);
			Users user2 = userRep.findById("ddd").orElse(null);
			CrewBoard board =crewboardRep.findById(2L).orElse(null);
			//chatboardRep.save(new ChatBoard(null, board, user1, user2, 0, null, null, "ddd님,동행구하셨나요?", 0) );
			chatboardRep.save(new ChatBoard(null, board, user2, user1, 0, null, null, "ccc님,아직구하지못하였습니다. 제주도 가시는 날짜가 언제인가요?", 0) );
		}
		
		/**핫딜*/
		@Test
		void timedealinsert() {
			/*LocalDate start = LocalDate.of(2022, 06, 01);
			/LocalDate end = LocalDate.of(2022, 06, 30);
			timedealRep.save(new TimeDeal(null, "제주도 동쪽 버스투어", 39900, 20000 ,30 , "제주도 동쪽을 도는 버스투어입니다. 1명만 신청하여도 가능하며 매일 진행합니다", 
				"사진", start, end, "https://www.myrealtrip.com/offers/79378") );*/
			
			/*LocalDate start2 = LocalDate.of(2022, 06, 01);
			LocalDate end2 = LocalDate.of(2022, 06, 15);
			timedealRep.save(new TimeDeal(null, "율랜드 스쿠버 다이빙체험 ", 95000, 50000, 30, 
					"초보자도 쉽게 할 수 있는 스쿠버 다이빙입니다. 장소는 서귀포시에서 진행하며 고프로로 사진도 찍어드립니다.",
					"사진", start2, end2, "https://www.myrealtrip.com/offers/84760") );*/
			
			LocalDate start3 = LocalDate.of(2022, 06, 01);
			LocalDate end3 = LocalDate.of(2022, 06, 10);
			timedealRep.save(new TimeDeal(null, "중문색달해변 서핑강습", 60000, 40000 ,30 , "초보자도 할 수 있는 서핑강습입니다. 슈트는 따로 렌탈하셔야 하며 사업장의 샤워실에서 환복하고 이동합니다.", 
				"사진", start3, end3, "https://www.myrealtrip.com/offers/104207") );
			
		}
		
		/**핫딜상세*/
		@Test
		void timeorderlineinsert() {
		 TimeDeal time = timedealRep.findById(1L).orElse(null);
		 //Orders 들어갈 자리 
		 
			timeorderlineRep.save(new TimeOrderLine(null, null, null, 1, 20000) );
		}
		

}




