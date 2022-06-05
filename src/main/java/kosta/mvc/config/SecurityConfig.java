package kosta.mvc.config;



import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import kosta.mvc.util.MemberAuthenticationProvider;
import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity 
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	
	private final MemberAuthenticationProvider provider;
	
	


	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests() 
		.anyRequest().permitAll()
		//.antMatchers("/","/user/**").permitAll()// "/","/user/**"제외
		//.hasAnyRole("USER","ADMIN")//권한 User , admin의 권한이 있어야한다
		//.antMatchers("/member/**")//member/** 아래는 무조건 인증되어야한다는 의미
		//.authenticated()
		//.antMatchers("/admin/**")//admin/** 는 admin만 권한이 있다는 의미
		//.hasRole("ADMIN")
		//.anyRequest().authenticated()//모든곳에서 권한이 필요하다는 의미
		.and()
		.csrf().disable() 
		.formLogin()
		.loginPage("/user/loginForm")
		.loginProcessingUrl("/loginCheck")
		.usernameParameter("id")//<input type="text" name="id">  input의 name과 usernameParameter의 값이 같아야함
		.passwordParameter("pwd")//<input type="text" name="pwd"> 
		.defaultSuccessUrl("/admin/list")//로그인 성공하면 가는 url주소
		.failureForwardUrl("/user/loginForm?error")
		.and()
		.logout()
		.logoutUrl("/logout")//호출하는 매핑
		.logoutSuccessUrl("/")//성공하면가능곳
		.invalidateHttpSession(true)//세션 종료 하는거
		.deleteCookies("JSESSIONID")//쿠키 없애는거
		.and();//끝
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(provider);
		
	}

}
