package kosta.mvc.util;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;




import kosta.mvc.domain.Users;

import kosta.mvc.repository.UserRepository;
import lombok.RequiredArgsConstructor;

@Service//id = memberAuthenticationProvider
@RequiredArgsConstructor
public class MemberAuthenticationProvider implements AuthenticationProvider {

	
	private final UserRepository userRep;	
	private final PasswordEncoder passwordEncoder;

	/**
	 * 로그인폼에서 username, password가 전송되면  UsernamePasswordAuthenticationToken객체를 만들어서 인수로 전달한다.
	 * 전달된 인수에서 username과 password를 꺼내서인증처리 (로그인 )를 하고 만약 실패하면
	 * 예외를 발생시키고 성공하면 인증된 사용자의 정보와 권한을 가져와서 Authentication에 저장해서 리턴한다.
	 * */
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		System.out.println("MemberAuthenticationProvider Authentication call");
		
		//1.username 즉 id를 꺼내서 Member테이블에 사용자정보를 가져온다.
		String id = authentication.getName();
		
		System.out.println("id"+id);
		
		Users user = userRep.selectUsersById(id);
		
		
		//1이 없으면 예외 발생시킨다.
		if(user==null)throw new UsernameNotFoundException(id+"에 해당하는 정보는 없습니다.");
		//있으면 인수전달된 평문과 디비에 저장된 암호화비번을 비교한다.
		String pass=authentication.getCredentials().toString();
		
		if(!passwordEncoder.matches(pass, user.getUserPassword())){//첫번째 인수는 평문 두번째가 암호화//일치하지 않으면 예외발생
			System.out.println("너임?");
			throw new UsernameNotFoundException("비밀번호 오류입니다.");
			
		}
		String role= user.getRole();
		
		SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role);
		
		authentication = new UsernamePasswordAuthenticationToken(user, null,Arrays.asList(authority));

		return authentication;
	}

	
	/**
	 * 인수로 전달된 인증정보가 인증을 할수 있는 유효한 객체인지를 판단해주는 메소드
	 * true를 리턴해야만 authenticate메소드 호출된다.
	 * */
	@Override
	public boolean supports(Class<?> authentication) {
		System.out.println("MemberAuthenticationProvider supports call");
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
