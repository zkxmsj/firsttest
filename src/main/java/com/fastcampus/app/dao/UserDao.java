package com.fastcampus.app.dao;

<<<<<<< HEAD
import java.util.List;

=======
>>>>>>> 7c26d0eca97397b4f0d4be9c7bb7abdb5a96c78f
import com.fastcampus.app.domain.UserDto;

public interface UserDao {
	public UserDto selectUser(String id);
	public int insertUser(UserDto user);
	public int deleteUser(String id);
	public int updateUser(UserDto user);
	public void deleteAll();
<<<<<<< HEAD
	public List<UserDto> seleteAll();
=======
	public void seleteAll();
>>>>>>> 7c26d0eca97397b4f0d4be9c7bb7abdb5a96c78f
	public int idCheck(String id);
}
