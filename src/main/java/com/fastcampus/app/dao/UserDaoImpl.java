package com.fastcampus.app.dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;


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





	@Override
	public int idCheck(String userId) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"idCheck",userId);
	}


	@Override
	public List<UserDto> seleteAll() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectAll");
	}

	@Override
	public UserDto read(String userId) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"read", userId);
	}

	@Override
	public int insertUserAuth(String userId) {
		// TODO Auto-generated method stub
		return session.insert(namespace+"insertAuth",userId);
	}

	
		
	
}
