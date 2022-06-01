package kosta.mvc.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
	
	
	@Override
	public List<Notice> selectAll() {
		
		return noticeRep.findAll(Sort.by(Sort.Direction.DESC, "noticeId"));
	}

	@Override
	public Notice selectById(Long noticeId) {
		
	   Notice notice = noticeRep.findById(noticeId).orElse(null);
	   if(notice==null)new RuntimeException("오류가 발생했습니다.");
	   return null;
	}

	@Override
	public void insert(Notice notice, String uploadPath) {
		
		Notice saveNotice = noticeRep.save(notice);
		
		MultipartFile file = notice.getFile();
		if (!file.isEmpty()) {
			if (file.getContentType().startsWith("image") == false) {
				// 런타임예외 발생시키기(이미지가 아닐 때)
			}
			
			try {
				String storeFIleName = fileStore.storeFile(uploadPath, file);
				notice.setNoticeAttach(storeFIleName);
			} catch (IOException e) {
				// 런타임예외 빌셍시키기(파일 입출력 관련)
			}
		}
			
	}

	@Override
	public Notice update(Notice notice) {
		
		Notice dbNotice = noticeRep.findById(notice.getNoticeId()).orElse(null);
		if(dbNotice==null) {
			throw new RuntimeException("오류로 인해 수정할수없습니다.");
		}
		dbNotice.setNoticeTitle(notice.getNoticeTitle());
		dbNotice.setNoticeContent(notice.getNoticeContent());
        
		return dbNotice;
	}

	@Override
	public void delete(Long noticeId) {
		
		Notice dbNotice = noticeRep.findById(noticeId).orElse(null);
		if(dbNotice==null) {
			throw new RuntimeException("오류로 인해 삭제할수 없습니다.");				
		}
		
	    noticeRep.deleteById(noticeId);
		

	}

}