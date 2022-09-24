package com.fastcampus.app.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.fastcampus.app.domain.CustomUser;
import com.fastcampus.app.domain.UserDto;
import com.fastcampus.app.mapper.MemberMapper;

public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println(username);	
		UserDto dto = mapper.read(username);
		System.out.println(dto);
		return dto == null ? null : new CustomUser(dto);
	}
}
