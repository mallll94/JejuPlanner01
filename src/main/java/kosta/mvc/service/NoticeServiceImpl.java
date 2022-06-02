package kosta.mvc.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kosta.mvc.domain.Notice;
import kosta.mvc.repository.NotiecRepository;
import kosta.mvc.util.FileStore;
import lombok.RequiredArgsConstructor;


@Service
@Transactional
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
    
	private final NotiecRepository noticeRep;
	
	private final FileStore fileStore;
	
	/**
	 * 전체보기
	 **/
	@Override
	public List<Notice> selectAll() {
		
		return noticeRep.findAll(Sort.by(Sort.Direction.DESC, "noticeId"));
	}
	
	/**
	 * 
	 **/

	@Override
	public Notice selectById(Long noticeId) {
		
	   Notice notice = noticeRep.findById(noticeId).orElse(null);
	   if(notice==null)new RuntimeException("오류가 발생했습니다.");
	   return notice;
	}
    
	/**
     * 상세보기
     **/
	
	@Override
	public void insert(Notice notice, String uploadPath) {
		
		Notice saveNotice = noticeRep.save(notice);
		
		MultipartFile file = notice.getFile();
		if (!file.isEmpty()) {
			if (file.getContentType().startsWith("image") == false) {
				throw new RuntimeException("이미지형식이 아닙니다.");
			}
			
			try {
				String storeFIleName = fileStore.storeFile(uploadPath, file);
				saveNotice.setNoticeAttach(storeFIleName);
			} catch (IOException e) {
				throw new RuntimeException("저장중에 문제가 발생하였습니다.", e);
			}
		}
			
	}

	
    
	/**
	 * 수정하기
	 **/
	
	@Override
	public Notice update(Notice notice, String uploadPath) {
		
		Notice dbNotice = noticeRep.findById(notice.getNoticeId())
				.orElseThrow( () -> new RuntimeException("오류로 인해 수정할 수 없습니다."));
	
		dbNotice.setNoticeTitle(notice.getNoticeTitle());
		dbNotice.setNoticeContent(notice.getNoticeContent());
		
		MultipartFile file = notice.getFile();
		if (!file.isEmpty()) {
			if (file.getContentType().startsWith("image") == false) {
				throw new RuntimeException("이미지형식이 아닙니다.");
			}		
			try {
				String storeFIleName = fileStore.storeFile(uploadPath, file);
				dbNotice.setNoticeAttach(storeFIleName);
			} catch (IOException e) {
				throw new RuntimeException("저장중에 문제가 발생하였습니다.", e);
			}
		}
        
		return dbNotice;
	}
    
	/**
	 * 삭제하기
	 **/
	
	@Override
	public void delete(Long noticeId) {
		
		Notice dbNotice = noticeRep.findById(noticeId).orElse(null);
		if(dbNotice==null) {
			throw new RuntimeException("오류로 인해 삭제할수 없습니다.");				
		}
		
	    noticeRep.deleteById(noticeId);
		

	}
	
			

}