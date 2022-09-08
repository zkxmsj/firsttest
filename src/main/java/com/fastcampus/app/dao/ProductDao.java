package com.fastcampus.app.dao;

import java.util.*;

import org.springframework.stereotype.Repository;

import com.fastcampus.app.domain.BoardDto;
import com.fastcampus.app.domain.ProductDto;
import com.fastcampus.app.domain.SearchCondition;
public interface ProductDao {
    ProductDto select(int pno);
    int delete(int pno);
    int insert(ProductDto dto);
    int update(ProductDto dto);
    int updateStock(Integer pno,Integer amount);
    List<ProductDto> relative(String category);
    List<ProductDto> selectAll() ;
}
