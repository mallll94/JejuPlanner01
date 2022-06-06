package kosta.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Diary;
import kosta.mvc.domain.DiaryLine;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.domain.QDiary;
import kosta.mvc.domain.QPlace;
import kosta.mvc.dto.DiaryLineDTO;
import kosta.mvc.dto.PlannerPlaceDTO;
import kosta.mvc.repository.DiaryLineRepository;
import kosta.mvc.repository.DiaryRepository;
import kosta.mvc.util.FileStore;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class DiaryServiceImpl implements DiaryService {

	private final DiaryRepository diaryRep;
	private final DiaryLineRepository diaryLineRep;
	private final FileStore fileStore;
	
	@Override
	public List<Diary> selectAll(String userId) {
		List<Diary> list = diaryRep.findByUserId(userId);
		return list;
	}

	@Override
	public Page<Diary> selectAllPageing(Pageable pageable, String loginUser) {
		//userId별 검색
		QDiary diary = QDiary.diary;
		BooleanBuilder builder = new BooleanBuilder();
		builder.and(diary.user.userId.eq(loginUser));
		Page<Diary> pageList = diaryRep.findAll(builder,pageable);
		
		return pageList;
	}
	
	/**다이어리별 다이어리 내용 조회*/
	@Override
	public List<DiaryLineDTO> selectById(Long diaryId) {
		Diary diary = diaryRep.getById(diaryId);
		List<DiaryLine> diaryLinelist =diaryLineRep.findAllByDiary(diaryId);
		List<DiaryLineDTO> result = new ArrayList<DiaryLineDTO>();
		
		for(DiaryLine x :diaryLinelist) {
			result.add(new DiaryLineDTO(x.getDiaryLineId(), x.getDiary().getDiaryId(), x.getPlannerPlace().getPlannerPlaceId(), x.getDiaryLineContent(),
					x.getDiaryLinePhoto(), x.getDiaryLinePrice(),x.getPlannerPlace().getPlace().getPlaceId(),  x.getPlannerPlace().getPlace().getPlaceName(),
					x.getPlannerPlace().getPlace().getPlaceAddr(), x.getPlannerPlace().getPlace().getPlaceContent(),
					x.getPlannerPlace().getPlace().getPlacePhoto(), x.getPlannerPlace().getPlace().getPlaceUrl()));
		}
		
		return result;
	}
	
	
	
	
	

	@Override
	public void insertDiary(Diary diary) {
		diaryRep.save(diary);

	}

	@Override
	public void updateDiary(Diary diary) {
		Diary dbDiary =diaryRep.findById(diary.getDiaryId())
				.orElseThrow( () -> new RuntimeException("해당 다이어리를 찾을 수 없습니다."));
		dbDiary.setDiaryTitle(diary.getDiaryTitle());
		dbDiary.setDiaryType(diary.getDiaryType());
		dbDiary.setDiaryCount(diary.getDiaryCount());

	}

	@Override
	public void deleteDiary(Long diaryId) {
		diaryRep.deleteById(diaryId);

	}

	@Override
	public void insertDiaryLine(DiaryLine diaryLine, String uploadPath) {
		DiaryLine saveDiaryline =diaryLineRep.save(diaryLine);
		
		MultipartFile file = diaryLine.getFile();
		if(!file.isEmpty()) {
			if(file.getContentType().startsWith("image")==false) {
				throw new RuntimeException("이미지형식이 아닙니다.");
			}
			try {
				String storeFileName = fileStore.storeFile(uploadPath, file);
				saveDiaryline.setDiaryLinePhoto(storeFileName);
			}catch(IOException e) {
				throw new RuntimeException("파일을 업로드 하는 도중 문제가 발생했습니다.",e);
			}
		}

	}

	@Override
	public void updateDiaryLine(DiaryLine diaryLine, String uploadPath) {
		DiaryLine dbDiaryLine = diaryLineRep.findById(diaryLine.getDiaryLineId())
				.orElseThrow(() -> new RuntimeException("다이어리 상세 내용을 찾을 수 없습니다."));
		dbDiaryLine.setDiaryLineContent(diaryLine.getDiaryLineContent());
		dbDiaryLine.setDiaryLinePrice(diaryLine.getDiaryLinePrice());
		
		MultipartFile file = diaryLine.getFile();
		if(!file.isEmpty()) {
			if(file.getContentType().startsWith("image")==false) {
				throw new RuntimeException("이미지형식이 아닙니다.");
			}
			try {
				String storeFileName = fileStore.storeFile(uploadPath, file);
				dbDiaryLine.setDiaryLinePhoto(storeFileName);
			}catch(IOException e) {
				throw new RuntimeException("파일을 업로드 하는 도중 문제가 발생했습니다.",e);
			}
		}
	}

	@Override
	public void DeleteDiaryLine(Long diaryLineId) {
		DiaryLine dbDiaryLine = diaryLineRep.findById(diaryLineId).orElse(null);
		if(dbDiaryLine==null) {
			throw new RuntimeException("오류로 인해 삭제 할 수 없습니다.");
		}
		diaryLineRep.deleteById(diaryLineId);

	}

}
