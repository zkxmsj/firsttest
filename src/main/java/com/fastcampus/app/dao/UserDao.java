package com.fastcampus.app.dao;

import java.util.List;

import com.fastcampus.app.domain.UserDto;

public interface UserDao {
	public UserDto selectUser(String id);
	public int insertUser(UserDto user);
	public int deleteUser(String id);
	public int updateUser(UserDto user);
	public void deleteAll();
	public List<UserDto> seleteAll();
	public int idCheck(String id);
}
