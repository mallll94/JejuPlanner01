package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Diary;
import kosta.mvc.domain.DiaryLine;

public interface DiaryService {

	/**
	 * 다이어리 목록(전체) 조회
	 * */
	List<Diary> selectAll(String userId);
	
	/**
	 * 다이어리 상세 조회
	 * */
	Diary selectById(Long diaryId);
	
	/**
	 * 다이어리 생성
	 * */
	void insertDiary(Diary diary);
	
	/**
	 * 다이어리 수정-타입/인원/제목/사진
	 * */
	void updateDiary(Diary diary);
	
	/**
	 * 다이어리 삭제
	 * */
	void deleteDiary(Long diaryId);
	
	/**
	 * 다이어리 내용 추가
	 * */
	void insertDiaryLine(DiaryLine diaryLine, String uploadPath);
	
	/**
	 * 다이어리 내용 수정
	 * */
	void updateDiaryLine(DiaryLine diaryLine, String uploadPath);
	
	/**
	 * 다이어리 내용 삭제
	 * */
	void DeleteDiaryLine(Long diaryLineId);
}
