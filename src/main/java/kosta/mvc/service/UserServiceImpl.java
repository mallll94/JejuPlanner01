package kosta.mvc.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
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
	public String kakaoGetAccessToken(String code) {
		String access_Token ="";
		String refresh_Token="";
		String reqURL ="https://kauth.kakao.com/oauth/token";
		/*
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn =  (HttpURLConnection)url.openConnection();
			
			//HttpURLConnection 설정 값 셋팅
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);


            // buffer 스트림 객체 값 셋팅 후 요청
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=REST API 앱키 입력");  //앱 KEY VALUE
            sb.append("&redirect_uri=http://localhost:8080/kakao_callback"); // 앱 CALLBACK 경로
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //  RETURN 값 result 변수에 저장
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String br_line = "";
            String result = "";

            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);


            // 토큰 값 저장 및 리턴
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
*/
        return access_Token;
		
	}

}
