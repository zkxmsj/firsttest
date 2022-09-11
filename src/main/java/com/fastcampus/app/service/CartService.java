package com.fastcampus.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fastcampus.app.dao.CartDao;
import com.fastcampus.app.domain.CartDto;
@Service
public class CartService {
	
	@Autowired
	private CartDao dao;
	
	
	public List<CartDto> getCart(String userId){
		return dao.select(userId); 
	}
	
	public int insertCart(CartDto dto) {
		return dao.insert(dto);
	}
	public int deleteCart(int cno,int pno,String userId) {
		Map map = new HashMap();
		map.put("userId",userId);
		map.put("pno", pno);
		map.put("cno",cno);
		return dao.delete(map);
	}
	public int getTotal(String userId) throws Exception{
		return dao.getTotal(userId);
	}
	public int deleteCartAll(String userId) {
		return dao.deleteAll(userId);
	}
}
