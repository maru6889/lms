package com.metanetglobal.LMS.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		http.csrf((csrfConfig) -> csrfConfig.disable());
		// 로그인 폼에 대한 설정
		http.formLogin((formLogin) -> formLogin
				// 로그인 뷰 페이지에 대해서 명시를 합니다.
				.loginPage("student/login")
				// Spring security는 기본적으로 세션을 사용하여 로그인을 구현한다.
				// 이전에서 다른 로그인 방식을 구현했을 때는 DB와 데이터를 직접적으로 비교하는
				// 코드를 작성했었는데,
				// password를 DB pwd와 비교하는 코드가 따로 나와있지 않은데,
				// UserDetailsService -> loadUserByUsername메서드를 통해서
				// 객체를 생성하여 반환할 때 Spring security 내부적으로
				// username에 대하여 사용자 정보, password를 비교하게 된다.
				// 이때 사용하는 userid에 대해서 사용할 파라미터, 매개변수를 명시한는 코드이
				.usernameParameter("studentId")
				// 로그인 성공했을 때 이동할 페이지 명시
				.defaultSuccessUrl("/"))
		
				// 로그아웃에 대해서 설정하는 곳.
				.logout(logout -> logout
						// 로그아웃 뷰 페이지에 대해서 명시를 합니다. 
						.logoutUrl("student/logout")
						// 로그아웃에 성공했을 때 이동할 페이지에 대해서 명시
						.logoutSuccessUrl("/student/login")
						// 세션 인증 정보에 대해서 로그아웃시 비활성화합니다.
						.invalidateHttpSession(true));
		
		http.authorizeHttpRequests()
		.requestMatchers("/file/**").hasRole("ADMIN")
		.requestMatchers("/lecture/**").hasAnyRole("USER", "ADMIN")
		.requestMatchers("/**", "/css/**", "/js/**", "/image/**").permitAll()
		.requestMatchers("/student/insert", "/student/login").permitAll();
		// 빌터 패턴을 통해서 http 객체를 빌드하고 반환합니다.
		return http.build();
	}
}