package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.QGoods;
import kosta.mvc.domain.QOrders;
import kosta.mvc.domain.QUsers;
//import kosta.mvc.domain.QUsers;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.OrdersRepository;
import kosta.mvc.repository.UserRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
	
	private final UserRepository userRep;

	private final PasswordEncoder passwordEncoder;
	
	private final OrdersRepository ordersRep;
	
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
    
	/**
	 *  회원정보 수정하기
	 **/
	@Override
	public void updateUsers(Users users) {
	
		Users dbUsers = userRep.findById(users.getUserId())
				.orElseThrow(() -> new RuntimeException("존재하지 않는 아이디입니다."));
	
		dbUsers.setUserPassword(users.getUserPassword());
		dbUsers.setUserPhone(users.getUserPhone());
		dbUsers.setUserGender(users.getUserGender());
		dbUsers.setUserEmail(users.getUserEmail());
   
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
			builder.and(users.userEmail.equalsIgnoreCase(user.getUserEmail()));
			builder.and(users.userId.equalsIgnoreCase(user.getUserId()));
			System.out.println(user.getUserPhone()+"|"+user.getUserEmail()+"|"+user.getUserName()+"|"+user.getUserId());
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
	public void findUpdatePwd(String userId ,String userPassword) {
		Users result = userRep.findById(userId).orElse(null);
		result.setUserPassword(userPassword);
		

	}
    
	/**
	 *  탈퇴하기
	 **/
	@Override
	public void deleteUsers(String userId, String userPassword) {
		// 사용자 불러오기
		//Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//String encodedPassword = passwordEncoder.encode(users.getUserPassword());
		Users result = userRep.findById(userId).orElseThrow(() -> new RuntimeException("회원정보가 없습니다."));
		//DB랑 비교
		if(!passwordEncoder.matches(userPassword, result.getUserPassword())) {
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
		}else {
			userRep.deleteById(result.getUserId());
		}

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

	@Override
	public Page<Users> selectByCata(String filter, int nowPage, int PageCount) {
		
		QUsers users = QUsers.users;
		QGoods goods = QGoods.goods;
		QOrders orders = QOrders.orders;
		BooleanBuilder builder = new BooleanBuilder();
		
		Pageable pageable = PageRequest.of((nowPage-1), PageCount, Direction.DESC, "userId");
		
		Page<Users> result = null;
		
		if(filter == null){
			 result =  userRep.findAll(pageable);
		}else{
			
			result = userRep.findAll(builder, pageable);
			//List<Orders> list= (List<Orders>) orderRep.findAll(builder);
		}

		return result;
	}

	@Override
	public int emailCheck(String email) {
	
		QUsers users = QUsers.users;
		BooleanBuilder builder = new BooleanBuilder();
		
		builder.and(users.userEmail.equalsIgnoreCase(email));
		
		Long result=userRep.count(builder);
		int check=result.intValue();
		return check;
	}

}
