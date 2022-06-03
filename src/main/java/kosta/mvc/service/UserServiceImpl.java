package kosta.mvc.service;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.mvc.domain.Users;
import kosta.mvc.repository.UserRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
	
	private final UserRepository userRep;

	@Override
	public Users loginCheck(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertUsers(Users users) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateUsers(Users users) {
		// TODO Auto-generated method stub

	}

	@Override
	public void selectbyIdandEmail(String userId, String email) {
		// TODO Auto-generated method stub
		
	}

	
	@Override
	public int findPwdCheck(Users users) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void findUpdatePwd(String userId, String userPassword) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUsers(String userId, String userPassword) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Users> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Users selectById(String userId) {
		Users user =userRep.findById(userId).orElse(null);
		return user;
	}

}
