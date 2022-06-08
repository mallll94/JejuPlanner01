package kosta.mvc.service;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.QUsers;
//import kosta.mvc.domain.QUsers;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.UserRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
	
	private final UserRepository userRep;

	private final PasswordEncoder passwordEncoder;
	
	
	
	@Override
	public Users loginCheck(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertUsers(Users users) {
		String encodedPassword = passwordEncoder.encode(users.getUserPassword());
		System.out.println(encodedPassword);
		users.setUserPassword(encodedPassword);
		userRep.save(users);
		
		
		
	}

	@Override
	public void updateUsers(Users users) {
		// TODO Auto-generated method stub

	}

	@Override
	public String selectbyIdandEmail(Users user) {
		String id="";
		
		QUsers users = QUsers.users;
		BooleanBuilder builder = new BooleanBuilder();
		if((user.getUserName()==null ||user.getUserName().equals(""))) {
			System.out.println("값없는 오류");
			new RuntimeException("오류가 발생했습니다.");
		}else {
			builder.and(users.userName.eq(user.getUserName()));
			builder.and(users.userPhone.eq(user.getUserPhone()));
			builder.and(users.userEmail.eq(user.getUserEmail()));
			System.out.println("111");
			String userId = userRep.findOne(builder).get().getUserId();			
			//userId 뒤에 ** 표시 해주는과정
			int length = userId.length();
			userId =userId.substring(0,length-2);
			id = userId+"**";
		
		}

		System.out.println("id : "+id);
		
		if(id==null || id=="") {
			id="해당하는 정보가 없습니다.";
		}
		return id;
	}

	
	@Override
	public String findPwdCheck(Users user) {
		String id="";
		
		QUsers users = QUsers.users;
		BooleanBuilder builder = new BooleanBuilder();
		if((user.getUserName()==null ||user.getUserName().equals(""))) {
			System.out.println("값없는 오류");
			new RuntimeException("오류가 발생했습니다.");
			
		}else {
			builder.and(users.userName.eq(user.getUserName()));
			builder.and(users.userPhone.eq(user.getUserPhone()));
			builder.and(users.userEmail.eq(user.getUserEmail()));
			builder.and(users.userId.eq(user.getUserId()));
			System.out.println("111");
			id = userRep.findOne(builder).get().getUserId();			
		
		}

		System.out.println("id : "+id);
		
		if(id==null || id=="") {
			id="해당하는 정보가 없습니다.";
		}
		return id;
	}

	@Override
	public void findUpdatePwd(Users user) {
		Users result = userRep.findById(user.getUserId()).orElse(user);
		result.setUserPassword(user.getUserPassword());
		

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

	@Override
	public String idcheck(String id) {
		QUsers users = QUsers.users;
		BooleanBuilder builder = new BooleanBuilder();	
		builder.and(users.userId.eq(id));
		
		Long count=userRep.count(builder);
		System.out.println(count);
		return (count==0L) ? "ok":"fail";

	}
	
	@Override
	public String kakaoGetAccessToken(String auth) {
		String access_Token ="";
		String refresh_Token="";
		String reqURL ="https://kauth.kakao.com/oauth/token";
		
//		try {
//			URL url = new URL(reqURL);
//			//HttpURLConnection conn = 
//		}
		
		return null;
		
	}

}
