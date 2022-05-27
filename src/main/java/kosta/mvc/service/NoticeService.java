package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Notice;

public interface NoticeService {

	/**
	 * 공지사항 목록 조회
	 * */
	List<Notice> selectAll();
	
	/**
	 * 공지사항 상세 조회
	 * */
	Notice selectById(Long noticeId);
	
	/**
	 * 공지사항 등록- 관리자
	 * */
	void insert(Notice notice);
	
	/**
	 * 공지사항 수정- 관리자
	 * */
	void update(Notice notice);
	
	/**
	 * 공지사항 삭제- 관리자
	 * */
	void delete(Long noticeId);
}
