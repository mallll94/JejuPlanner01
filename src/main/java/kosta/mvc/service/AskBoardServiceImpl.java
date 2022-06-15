package kosta.mvc.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.AskBoard;
import kosta.mvc.domain.QAskBoard;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.AskBoardRepository;
import kosta.mvc.repository.UserRepository;
import kosta.mvc.util.FileStore;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AskBoardServiceImpl implements AskBoardService {
	
	private final AskBoardRepository askBoardRep;
	private final FileStore fileStore;
	private final UserRepository userRep;
	
	
	/**전체조회*/
	@Override
	public List<AskBoard> getAllAskBoards() {
		
		return askBoardRep.findAll(Sort.by(Sort.Direction.DESC, "AskId"));
	}
	
	/**전체조회 - 페이지처리*/
	@Override
	public Page<AskBoard> getAllAskBoards(Pageable pageable) {
		
		return askBoardRep.findAll(pageable);
	}


	/**등록하기*/
	@Override
	public void addAskBoard(AskBoard askBoard, String uploadpath) {
		AskBoard saveAsk = askBoardRep.save(askBoard);
		
		MultipartFile file = askBoard.getFile();
		if(!file.isEmpty()) {
			if(file.getContentType().startsWith("image") == false) {
				throw new RuntimeException("이미지형식이 아닙니다");
			}
			
			try {
				String storeFileName = fileStore.storeFile(uploadpath, file);
				saveAsk.setAskAttach(storeFileName);
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("저장중 문제가 발생하였습니다.", e);
			}
		}
		
	}


	/**askboardId 이용해서 조회*/
	@Override
	public AskBoard getAskBoard(Long askId) {
		System.out.println("askId = "+askId);
		AskBoard askBoard = askBoardRep.findById(askId)
				.orElseThrow(() -> new RuntimeException("상세보기에 오류가 발생하였습니다."));
		System.out.println(askBoard.getAskTitle()+" 댓글:: "+askBoard.getAskReplyList().size()+" :: ");
		return askBoard;
	}

	/**삭제하기*/
	@Override
	public void deleteAskBoard(Long askId) {
		
		AskBoard dbAsk = askBoardRep.findById(askId).orElse(null);
		if(dbAsk==null) {
			throw new RuntimeException("오류로 인해 삭제할 수 없습니다.");
		}
		
		askBoardRep.deleteById(askId);

	}
	
	
	/**답변 Y or N*/
    @Override
	public void complete(Long askId , String btnradio) {
		
		AskBoard ask = getAskBoard(askId);
		
		ask.setAskComplete(btnradio);
		
	}
	

	/**내가 쓴 글 목록 조회하기*/
	@Override
	public Page<AskBoard> selectByUserId(String userId , Pageable pageable) {
						
		Users user = userRep.findById(userId).orElseThrow(() -> new RuntimeException("사용자가 조회되지 않습니다."));
		QAskBoard ask = QAskBoard.askBoard;
		BooleanBuilder builder = new BooleanBuilder();
		builder.and(ask.user.userId.eq(user.getUserId()));
		
		/*
		 * Pageable pageable = PageRequest.of((nowPage-1), PAGE_COUNT , Direction.DESC,
		 * "AskId");
		 */
		
		Page<AskBoard> askList = askBoardRep.findAll(builder ,pageable);
		
		
		return askList;
	}



}
