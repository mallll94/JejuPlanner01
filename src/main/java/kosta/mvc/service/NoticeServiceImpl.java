package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Notice;
import kosta.mvc.repository.NotiecRepository;
import lombok.RequiredArgsConstructor;


@Service
@Transactional
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
    
	private final NotiecRepository noticeRep;
	
	@Override
	public List<Notice> selectAll() {
		
		return noticeRep.findAll();
	}

	@Override
	public Notice selectById(Long noticeId) {
		
	   Notice notice = noticeRep.findById(noticeId).orElse(null);
	   if(notice==null)new RuntimeException("오류가 발생했습니다.");
	   return null;
	}

	@Override
	public void insert(Notice notice) {
		
		Notice saveNotice = noticeRep.save(notice);	
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