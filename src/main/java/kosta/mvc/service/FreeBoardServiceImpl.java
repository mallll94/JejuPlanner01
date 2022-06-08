package kosta.mvc.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.FreeBoard;
//import kosta.mvc.domain.QFreeBoard;
import kosta.mvc.repository.FreeBoardRepository;
import kosta.mvc.util.FileStore;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class FreeBoardServiceImpl implements FreeBoardService {
	
	private final FreeBoardRepository freeBoardRep;
	
	private final FileStore fileStore;
    
	/**
	 * 소통게시판 등록하기
	 */
	@Override
	public void addFreeBoard(FreeBoard freeBoard, String uploadPath) {
		
		FreeBoard saveFreeBoard = freeBoardRep.save(freeBoard);
		
		MultipartFile file = freeBoard.getFile();
		if(!file.isEmpty()) {
			if(file.getContentType().startsWith("image") == false) {
				throw new RuntimeException("올바른 이미지형식이 아닙니다.");
			}
			try {
				String storeFIleName = fileStore.storeFile(uploadPath, file);
				saveFreeBoard.setFreeAttach(storeFIleName);
			}catch(IOException e) {
				e.printStackTrace();
				throw new RuntimeException("저장중에 문제가 발생하였습니다.", e);
			}
		}
		

	}
    
	/**
	 * 소통게시판 수정하기
	 * @return 
	 */
	@Override
	public FreeBoard updateFreeBoard(FreeBoard freeBoard, String uploadPath) {
		
		 FreeBoard dbFreeBoard = freeBoardRep.findById(freeBoard.getFreeId())
				 .orElseThrow(() -> new RuntimeException("존재하지 않는 글입니다."));
		 
		 dbFreeBoard.setFreeCategory(freeBoard.getFreeCategory());
		 dbFreeBoard.setFreeTitle(freeBoard.getFreeTitle());
		 dbFreeBoard.setFreeContent(freeBoard.getFreeContent());
		 
		 MultipartFile file = freeBoard.getFile();
			if (!file.isEmpty()) {
				if (file.getContentType().startsWith("image") == false) {
					throw new RuntimeException("이미지형식이 아닙니다.");
				}		
				try {
					String storeFIleName = fileStore.storeFile(uploadPath, file);
					dbFreeBoard.setFreeAttach(storeFIleName);
				} catch (IOException e) {
					throw new RuntimeException("저장중에 문제가 발생하였습니다.", e);
				}
			}
	        
			return dbFreeBoard;
		}
		 
		 
		
    
	/**
	 * 소통게시판 전체 조회하기
	 */
	@Override
	public List<FreeBoard> getAllFreeBoards() {
		 
		return freeBoardRep.findAll(Sort.by(Sort.Direction.DESC, "freeId"));
	}
	
	/**
	 * 전체보기 page처리
	 **/
	@Override
	public Page<FreeBoard> getAllFreeBoards(Pageable pageable) {
		
		return freeBoardRep.findAll(pageable);
	}
	
	/**
	 * 소통게시판 조회하기
	 */
	@Override
	public FreeBoard getFreeBoard(Long freeId, boolean state) {
		
		if(state) {
			//조회수 여부
			freeBoardRep.updateReadNum(freeId);
		}
		
		FreeBoard freeBoard = freeBoardRep.findById(freeId).orElse(null);

		if(freeBoard==null) new RuntimeException("상세보기에 오류가 발생했습니다.");
		return freeBoard;
	}
    
	/**
	 * 소통게시판 삭제하기
	 */
	@Override
	public void deleteFreeBoard(Long freeBoardId) {
		
		FreeBoard dbFreeBoard = freeBoardRep.findById(freeBoardId).orElse(null);
		if(dbFreeBoard==null) {
			throw new RuntimeException("오류로 인해 삭제할수 없습니다.");
				
		}
		
		freeBoardRep.deleteById(freeBoardId);
		
	}
	
	/**
	 * 카테고리별 조회
	 **/
    @Override
	public Page<FreeBoard> selectByCate(String freeCategory, int nowPage, int PAGE_COUNT){
		//QFreeBoard free = QFreeBoard.freeBoard;
		BooleanBuilder builder = new BooleanBuilder();
		Pageable pageable = PageRequest.of( (nowPage-1), PAGE_COUNT, Direction.DESC , "freeId");
		
		
		Page<FreeBoard> result = null;
		
		if(freeCategory == null){
			 result = freeBoardRep.findAll(pageable);
		}else{
			//builder.and(free.freeCategory.contains(freeCategory));
			
			//result = freeBoardRep.findAll(builder, pageable);
		}
		
		
		return result;
	}
}
