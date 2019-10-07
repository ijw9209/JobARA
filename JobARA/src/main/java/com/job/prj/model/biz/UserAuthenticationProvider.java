package com.job.prj.model.biz;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.job.prj.dto.UserMemberDto;

public class UserAuthenticationProvider implements AuthenticationProvider{

	@Autowired
	private UserDetailsService userDeSer;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncorder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String id = (String)authentication.getPrincipal();
		String password = (String)authentication.getCredentials();
		System.out.println("id : " + id + "\t pw : " + password);
		UserMemberDto dto = (UserMemberDto)userDeSer.loadUserByUsername(id);
		
		ArrayList<GrantedAuthority> auth = (ArrayList<GrantedAuthority>)dto.getAuthorities();
		System.out.println("auth " + dto.getAuthorities());
		System.out.println(dto.getMember_pw());
		
		if(!bcryptPasswordEncorder.matches(password,dto.getPassword())) {
			System.out.println("비밀번호 오류");
			throw new BadCredentialsException("아이디나 비밀번호가 맞지 않습니다. 다시확인해주세요");
		}
		if(!dto.isEnabled()) {
			throw new BadCredentialsException("비활성화 된 계정입니다.");
		}
		
		
		System.out.println("provide 끝!");
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(dto, password, auth);
		return result;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	

}
