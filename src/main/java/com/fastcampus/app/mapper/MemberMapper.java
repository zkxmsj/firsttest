package com.fastcampus.app.mapper;

import com.fastcampus.app.domain.UserDto;

public interface MemberMapper {
	public UserDto read(String userid);
}
