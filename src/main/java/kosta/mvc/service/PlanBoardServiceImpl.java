package kosta.mvc.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Likes;
import kosta.mvc.domain.PlanBoard;
import kosta.mvc.domain.QPlanBoard;
//import kosta.mvc.domain.QPlanBoard;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.LikesRepository;
import kosta.mvc.repository.PlanBoardRepository;
import kosta.mvc.repository.UserRepository;
import kosta.mvc.util.FileStore;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class PlanBoardServiceImpl implements PlanBoardService {

	private final PlanBoardRepository planBoardRep;
	private final FileStore fileStore;
	private final LikesRepository likesRep;
	private final UserRepository userRep;

	/**전체조회*/
	@Override
	public List<PlanBoard> selectAll() {

		return planBoardRep.findAll();
	}

	/**전체조회 - 페이지처리*/
	@Override
	public Page<PlanBoard> selectAll(Pageable pageable) {

		return planBoardRep.findAll(pageable);
	}


	/**상세보기*/
	@Override
	public PlanBoard selectById(Long pboardId) {
		PlanBoard planBoard = planBoardRep.findById(pboardId)
				.orElseThrow(() -> new RuntimeException("상세보기에 오류가 발생하였습니다."));

		return planBoard;
	}
	
	/**좋아요 조회*/
	@Override
	public Likes selectByBoardId(Long pboardId, String userId) {
		Likes likes = likesRep.findlikesByUserIdAndPboardId(userId, pboardId);
		
		return likes;
	}


	/**등록하기*/
	@Override
	public void insertPlanBoard(PlanBoard planBoard, String uploadpath) {
		PlanBoard savePlan = planBoardRep.save(planBoard);

		MultipartFile file = planBoard.getFile();
		if(!file.isEmpty()) {
			if(file.getContentType().startsWith("image") == false) {
				throw new RuntimeException("이미지형식이 아닙니다");
			}

			try {
				String storeFileName = fileStore.storeFile(uploadpath, file);
				savePlan.setPboardAttach(storeFileName);
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("저장중 문제가 발생하였습니다.", e);
			}
		}

	}

	/**수정하기*/
	@Override
	public PlanBoard updatePlanBoard(PlanBoard planBoard, String uploadpath) {

		PlanBoard dbBoard = planBoardRep.findById(planBoard.getPboardId())
				.orElseThrow(() -> new RuntimeException("존재하지 않는 글 입니다. "));

		dbBoard.setPboardTitle(planBoard.getPboardTitle());
		dbBoard.setPboardContent(planBoard.getPboardContent());

		MultipartFile file = planBoard.getFile();
		if(!file.isEmpty()) {
			if(file.getContentType().startsWith("image") == false) {
				throw new RuntimeException("이미지형식이 아닙니다");
			}

			try {
				String storeFileName = fileStore.storeFile(uploadpath, file);
				dbBoard.setPboardAttach(storeFileName);
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("저장중 문제가 발생하였습니다.", e);
			}
		}

		return dbBoard;

	}

	/**삭제하기*/
	@Override
	public void deletePlanBoard(Long pboardId) {
		PlanBoard dbPlan = planBoardRep.findById(pboardId).orElse(null);
		if(dbPlan==null) {
			throw new RuntimeException("오류로 인해 삭제할 수 없습니다");
		}

		planBoardRep.deleteById(pboardId);
	}
	
	
	@Override
	public Page<PlanBoard> selectByCate(String pboardCategory, int nowPage, int PAGE_COUNT){
		QPlanBoard plan = QPlanBoard.planBoard;
		BooleanBuilder builder = new BooleanBuilder();
		Pageable pageable = PageRequest.of( (nowPage-1), PAGE_COUNT, Direction.DESC , "pboardId");
		
		
		Page<PlanBoard> result = null;
		
		if(pboardCategory == null){
			 result = planBoardRep.findAll(pageable);
		}else{
			builder.and(plan.pboardCategory.contains(pboardCategory));
			
			result = planBoardRep.findAll(builder, pageable);
		}
		
		
		return result;
	}

	@Override
	public int saveLikes(Long pboardId, String userId) {
		PlanBoard planBoard = planBoardRep.findById(pboardId)
				.orElseThrow(() -> new RuntimeException("게시글이 조회되지 않습니다."));
		
		Users user = userRep.findById(userId)
				.orElseThrow(() -> new RuntimeException("사용자가 조회되지 않습니다."));
	
		Likes likes = likesRep.findlikesByUserIdAndPboardId(userId, pboardId);
		System.out.println(likes);
		if(likes==null) {
			likesRep.save(new Likes(null, user, planBoard) );
	        System.out.println(1);
			return 1;
		}else {
			likesRep.deleteById(likes.getLikeId());
			System.out.println(0);
			return 0;
		}
		
		
	}

	/**내가 쓴 글 목록 조회하기*/
	@Override
	public List<PlanBoard> selectByUserId(String userId) {
		
		Users user = userRep.findById(userId).orElseThrow(() -> new RuntimeException("사용자가 조회되지 않습니다."));
		QPlanBoard plan = QPlanBoard.planBoard;
		BooleanBuilder builder = new BooleanBuilder();
		builder.and(plan.user.userId.eq(user.getUserId()));
		
		List<PlanBoard> planList = (List<PlanBoard>)planBoardRep.findAll(builder);
		
		return planList;
	}



	

}
