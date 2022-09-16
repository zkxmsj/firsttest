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
import com.fastcampus.app.domain.UserOrderDto;

@Repository
public class UserOrderDaoImpl implements UserOrderDao{
	
	@Autowired
	private SqlSession session;
	private String namespace = "com.fastcampus.app.UserOrderDao.";
	
	@Override
	public List<UserOrderDto> selectList(String id) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectList", id);
	}
	@Override
	public int insertUserOrder(UserOrderDto dto) {
		// TODO Auto-generated method stub
		return session.insert(namespace+"insert",dto);
	}
	@Override
	public int deleteUserOrder(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public UserOrderDto selectOrder(Integer orderno) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"select"+orderno);
	}
	@Override
	public List<UserOrderDto> selectAll() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectAll");
	}
	@Override
	public List<UserOrderDto> selectUserOrder(String userId) {
		// TODO Auto-generated method stub
		System.out.println(userId);
		return session.selectList(namespace+"selectUserOrder",userId);	
		}
	
	
		
	
}
