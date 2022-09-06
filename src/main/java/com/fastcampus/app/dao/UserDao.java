package com.fastcampus.app.dao;

import com.fastcampus.app.domain.User;

public interface UserDao {
	public User selectUser(String id);
	public int insertUser(User user);
	public int deleteUser(String id);
	public int updateUser(User user);
	public void deleteAll();
	public void seleteAll();
}
