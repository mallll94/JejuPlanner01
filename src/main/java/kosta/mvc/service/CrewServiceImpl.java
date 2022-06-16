package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.CrewBoard;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.CrewBoardRepository;
import kosta.mvc.repository.UserRepository;
import lombok.RequiredArgsConstructor;


@Service
@Transactional
@RequiredArgsConstructor
public class CrewServiceImpl implements CrewService {

	private final CrewBoardRepository crewBoardRep;
	private final UserRepository userRep;
	
	/**
	 * 전체보기
	 **/
	@Override
	public List<CrewBoard> selectAll() {
		
		return crewBoardRep.findAll(Sort.by(Sort.Direction.DESC,"crewId"));
	}

	/**
	 * 전체보기 page처리
	 **/
	@Override
	public Page<CrewBoard> selectAll(Pageable pageable) {
		
		return crewBoardRep.findAll(pageable);
	}
	
	
	/**
	 * 상세보기
	 **/
	@Override
	public CrewBoard selectById(Long crewId) {
		
		CrewBoard crewBoard = getCrewBoard(crewId);
	    
		return crewBoard;
	}
	
	/**
	 * 동행 구하기 완료여부
	 **/
	@Override
	public void changeState(Long crewId,String btnradio) {
		
		CrewBoard crewBoard = getCrewBoard(crewId);
	    
	    crewBoard.setCrewState(btnradio);
	   
	}
	
   	
	private CrewBoard getCrewBoard(Long crewId) {
		CrewBoard crewBoard = crewBoardRep.findById(crewId)
				.orElseThrow(() -> new RuntimeException("존재하지 않는 글입니다."));
		return crewBoard;
	}
    
	
	/**
	 * 등록하기
	 **/
	@Override
	public void insertCrewBoard(CrewBoard crewBoard) {
	
		CrewBoard saveCrew = crewBoardRep.save(crewBoard);

	}
	
	/**
	 * 수정하기
	 **/
	@Override
	public CrewBoard updateCrewBoard(CrewBoard crewBoard) {
	   
		CrewBoard dbBoard = crewBoardRep.findById(crewBoard.getCrewId()).orElse(null);
		if(dbBoard==null) {
			throw new RuntimeException("글번호 오류로 수정할수 없습니다.");
		}
		
		dbBoard.setCrewTitle(crewBoard.getCrewTitle());
		dbBoard.setCrewContent(crewBoard.getCrewContent());
		dbBoard.setCrewState(crewBoard.getCrewState());
		
		return dbBoard;

	}
	
	/**
	 * 삭제하기
	 **/
	@Override
	public void deleteCrewBoard(Long crewId) {
		
		CrewBoard dbBoard = crewBoardRep.findById(crewId).orElse(null);
		if(dbBoard==null) {
			throw new RuntimeException("글번호 오류로 삭제할수 없습니다.");
		}
	    
		crewBoardRep.deleteById(crewId);

	}
    
	/**
	 * 마이페이지 조회
	 **/
	@Override
	public Page<CrewBoard> selectByUserId(String userId, int nowPage, int PageCount) {
		
	 Users user = userRep.findById(userId).orElseThrow(() -> new RuntimeException("사용자가 조회되지 않습니다."));
   	 Pageable pageable = PageRequest.of( (nowPage-1), PageCount, Direction.DESC , "crewId");	
	 	
	 return crewBoardRep.findAllByUser(user, pageable);
   	 
	}
	
	
}
