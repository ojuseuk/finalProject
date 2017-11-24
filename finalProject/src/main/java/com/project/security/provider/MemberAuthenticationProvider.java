package com.project.security.provider;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.dao.UsrDao;
import com.project.dto.USRDto;

/** 사용자 정보 및 암호 일치 여부 비교
 * 1. 개발 방법 : AuthenticationProvider 구현
 * 2. authenticate() 재정의 규칙
 * 	1. parameter로 전달받은 객체에 대해 인증 처리를 지원하지 않는다면 null 리턴
 * 	2. "		 객체를 이용해서 인증에 실패했다면 AuthenticationException 발생
 * 	3. 인증에 성공하면, 인증 정보를 담은 Authentication 객체 반환
 */
@Service // id="memberAuthenticationProvider"
public class MemberAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private UsrDao usrDao;

//	@Autowired
//	private PasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		if (!supports(auth.getClass())) {
			return null;
		}

		// 1. 인수로 받는 user정보를 가지고 디비에 존재하는지 체크
		String id = auth.getName();
		USRDto usrDto = usrDao.userLoginId(id);
		System.out.println(usrDto);
		
		if (usrDto == null) {// ID가 없는경우
			throw new UsernameNotFoundException(id + "는 없는 회원입니다.");
		}

		// 2. 존재하면 비밀번호 비교
		String password = (String) auth.getCredentials();// 비밀번호
		
//		if (!passwordEncoder.matches(password, usrDto.getPw())) {
//			throw new BadCredentialsException("패스워드 오류입니다.");
//		}


		// db에서 가지고 온 권한을 GrantedAuthority 로 변환 
		List<SimpleGrantedAuthority> authList = new ArrayList<>();
		authList.add(new SimpleGrantedAuthority(usrDto.getUsrTp()));
		
		System.out.println(authList);
		
		return new UsernamePasswordAuthenticationToken(usrDto, null, authList);
	}

	/**
	 * 해당 타입의 Authentication객체를 이용해서 인증 처리를 할수 있는지 여부를 리턴해주는 메소드
	 */
	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
