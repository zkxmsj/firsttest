package com.fastcampus.app.dao;

import java.util.List;

import com.fastcampus.app.domain.UserDto;
import com.fastcampus.app.domain.UserOrderDto;

public interface UserOrderDao {
	public List<UserOrderDto> selectList(String id);
	public int insertUserOrder(UserOrderDto dto);
	public int deleteUserOrder(String id);
	public UserOrderDto selectOrder(Integer orderno);
	public List<UserOrderDto> selectAll();
	public List<UserOrderDto> selectUserOrder(String userId);
}
