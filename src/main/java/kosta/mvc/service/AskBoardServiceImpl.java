package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.AskBoard;
import kosta.mvc.repository.AskBoardRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AskBoardServiceImpl implements AskBoardService {
	
	private final AskBoardRepository askBoardRep;

	/**등록하기*/
	@Override
	public void addAskBoard(AskBoard askBoard) {
		AskBoard saveAsk = askBoardRep.save(askBoard);

	}

	/**전체조회*/
	@Override
	public List<AskBoard> getAllAskBoards() {
		
		return askBoardRep.findAll();
	}

	/**askboardId 이용해서 조회*/
	@Override
	public AskBoard getAskBoard(Long askBoardId) {
		AskBoard askBoard = askBoardRep.findById(askBoardId).orElse(null);
		if(askBoard==null) new RuntimeException("상세보기에 오류가 발생하였습니다.");
		
		return askBoard;
	}

	/**삭제하기*/
	@Override
	public void deleteAskBoard(Long askBoardId) {
		
		AskBoard dbAsk = askBoardRep.findById(askBoardId).orElse(null);
		if(dbAsk==null) {
			throw new RuntimeException("오류로 인해 삭제할 수 없습니다.");
		}
		
		askBoardRep.deleteById(askBoardId);

	}

}
