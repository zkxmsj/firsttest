package com.fastcampus.app.service;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.fastcampus.app.dao.UserDao;
import com.fastcampus.app.domain.UserDto;

@Service
public class UserService {
	
	@Autowired
	UserDao dao;
	
	public int idCheck(String userId) {
		return dao.idCheck(userId);
	}
	public UserDto getUser(String id) {
		return dao.selectUser(id);
	}
		
	
}