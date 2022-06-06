package kosta.mvc.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kosta.mvc.domain.PlanBoard;
import kosta.mvc.repository.PlanBoardRepository;
import kosta.mvc.util.FileStore;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class PlanBoardServiceImpl implements PlanBoardService {

	private final PlanBoardRepository planBoardRep;

	private final FileStore fileStore;

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

	@Override
	public List<PlanBoard> selectByUserId(Long userId) {
		// TODO Auto-generated method stub
		return null;
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

}
