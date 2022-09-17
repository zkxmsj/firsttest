package com.fastcampus.app.dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
<<<<<<< HEAD
import java.util.List;
=======
>>>>>>> 7c26d0eca97397b4f0d4be9c7bb7abdb5a96c78f

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import com.fastcampus.app.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession session;
	private String namespace = "com.fastcampus.app.UserDao.";
	
	@Override
	public UserDto selectUser(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"select",id);
	}

	@Override
	public int insertUser(UserDto user) {
		// TODO Auto-generated method stub
		return session.insert(namespace+"insert",user);
	}

	@Override
	public int deleteUser(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(UserDto user) {
		// TODO Auto-generated method stub
		return session.update(namespace+"update",user);
	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}

<<<<<<< HEAD
=======
	@Override
	public void seleteAll() {
		// TODO Auto-generated method stub
		
	}
>>>>>>> 7c26d0eca97397b4f0d4be9c7bb7abdb5a96c78f

	@Override
	public int idCheck(String userId) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"idCheck",userId);
	}
<<<<<<< HEAD

	@Override
	public List<UserDto> seleteAll() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectAll");
	}
=======
>>>>>>> 7c26d0eca97397b4f0d4be9c7bb7abdb5a96c78f
	
		
	
}
