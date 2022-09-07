package com.fastcampus.app.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fastcampus.app.domain.CartDto;
@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	private SqlSession session;
	private String namespace = "com.fastcampus.app.CartDao.";
	
	@Override
	public List<CartDto> select(String userId) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"select",userId);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return session.delete(namespace+"delete",map);
	}

	@Override
	public int insert(CartDto dto) {
		// TODO Auto-generated method stub
		return session.insert(namespace+"insert",dto);
	}
}
