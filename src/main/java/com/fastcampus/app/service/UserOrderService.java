package com.fastcampus.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fastcampus.app.dao.CartDao;
import com.fastcampus.app.dao.UserOrderDao;
import com.fastcampus.app.domain.OrderDto;
import com.fastcampus.app.domain.UserOrderDto;

@Service
public class UserOrderService {
	
	@Autowired
	UserOrderDao userorderDao;
	
	@Autowired
	CartDao cartDao;
	
	public int insertOrder(OrderDto dto) {
		for(int i=0;i<dto.getOrders().size();i++) {
			UserOrderDto orderDto = new UserOrderDto();
			orderDto.setUserId(dto.getUserId());
			orderDto.setUserName(dto.getUserName());
			orderDto.setOrderAddr1(dto.getOrderAddr1());
			orderDto.setOrderAddr2(dto.getOrderAddr2());
			orderDto.setOrderAddr3(dto.getOrderAddr3());
			orderDto.setOrderName(dto.getOrderName());
			orderDto.setPno(dto.getOrders().get(i).getPno());
			orderDto.setProductName(dto.getOrders().get(i).getProductName());
			orderDto.setAmount(dto.getOrders().get(i).getAmount());
			orderDto.setProductPrice(dto.getOrders().get(i).getProductPrice());
			orderDto.setTotalPrice(dto.getOrders().get(i).getTotalPrice());
			userorderDao.insertUserOrder(orderDto);
		}
		cartDao.deleteAll(dto.getUserId());
		return 1; 
	}
	public List<UserOrderDto> selectList(String userId){
		return userorderDao.selectList(userId);
	}
	
	public UserOrderDto select(Integer orderno) {
		return userorderDao.selectOrder(orderno);
	}
	
	public List<UserOrderDto> selectAll(){
		return userorderDao.selectAll();
	}
	public List<UserOrderDto> selectUserOrder(String userId){
		return userorderDao.selectUserOrder(userId);
	}
}
