package com.fastcampus.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fastcampus.app.domain.BoardDto;
import com.fastcampus.app.domain.CategoryDto;
import com.fastcampus.app.domain.ProductDto;
@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SqlSession session;
	private String namespace = "com.fastcampus.app.ProductDao.";
	
	@Override
	public ProductDto select(int pno){
		return session.selectOne(namespace+"select",pno);
	}

	@Override
	public int delete(int pno) {
		// TODO Auto-generated method stub
		return session.delete(namespace+"delete",pno);
	}

	@Override
	public int insert(ProductDto dto) {
		// TODO Auto-generated method stub
		return session.insert(namespace+"insert",dto);
	}

	@Override
	public int update(ProductDto dto) {
		// TODO Auto-generated method stub
		return session.update(namespace+"update",dto);
	}

	@Override
	public int updateStock(Integer pno,Integer amount) {
		// TODO Auto-generated method stub
			Map map = new HashMap();
			map.put("amount",-amount);
			map.put("pno",pno);
		return session.update(namespace+"updateStock",map);
	}

	@Override
	public List<ProductDto> selectAll() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectAll");
	}

	@Override
	public List<ProductDto> relative(String category) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"relative",category);
	}

	@Override
	public List<ProductDto> selectCategory(String category) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectCategory",category);
	}

	@Override
	public List<CategoryDto> getCategory() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"getCategory");
	}

	@Override
	public int insertCategory(String category) {
		// TODO Auto-generated method stub
		return session.insert(namespace+"insertCategory",category);
	}

	@Override
	public List<ProductDto> searchProduct(String productName) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"searchProduct",productName);
	}

}
