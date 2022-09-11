package com.fastcampus.app.dao;

import com.fastcampus.app.domain.UserDto;
import com.fastcampus.app.domain.UserOrderDto;

public interface UserOrderDao {
	public UserDto selectUserOrder(String id);
	public int insertUserOrder(UserOrderDto dto);
	public int deleteUserOrder(String id);
}
