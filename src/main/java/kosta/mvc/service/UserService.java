package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Users;

public interface UserService {

	/**
	 * 로그인 체크
	 * */
	Users loginCheck(String userId);
	
	/**
	 * 회원가입
	 * */
	void insertUsers(Users users);
	
	/**
	 * id체크
	 * */
	String idcheck(String id);
	
	
	/**
	 * 회원정보수정 -마이페이지
	 * */
	void updateUsers(Users users);
	
	
	
	/**
	 * ID찾기
	 * */
	String selectbyIdandEmail(Users user);
	
	
	/**
	 * Pwd찾기-정보받기
	 * 일단은 이렇게 썻는데 아마 바껴야할수도 있다. 그이유는 이메일인증방식때문에
	 *
	 * */
	String findPwdCheck(Users users);
	
	/**
	 * Pwd 찾고 비번 변경
	 * */
	void findUpdatePwd(Users user);
	
	/**
	 * 회원탈퇴 - state변경하는거
	 * */
	void deleteUsers(String userId, String userPassword);
	
	/**
	 * 회원 전체 목록 조회-관리자용
	 * */
	List<Users> selectAll();
	
	/**
	 * 회원 상세 조회 -회원, 관리자
	 * */
	Users selectById(String userId);
}
