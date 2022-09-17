package com.fastcampus.app.dao;

import java.util.*;


import com.fastcampus.app.domain.CartDto;
public interface CartDao {
    List<CartDto> select(String userId);
    int delete(Map map);
    int insert(CartDto dto);
    int getTotal(String userId) throws Exception;
    int deleteAll(String userId);
}
