package com.fastcampus.app.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fastcampus.app.dao.ProductDao;
import com.fastcampus.app.domain.CategoryDto;
import com.fastcampus.app.domain.ProductDto;

@Service
public class ProductService {
	@Autowired
	ProductDao productDao;
	
	public List<ProductDto> getProductList(){
		return productDao.selectAll();
				
	}
	public ProductDto selectProduct(int pno) {
			return productDao.select(pno);
		}	
		
	public void registProduct(ProductDto productDto) {
		productDao.insert(productDto);
	}
	public void modifyProduct(ProductDto productDto) {
			productDao.update(productDto);
	}
	public void deleteProduct(int pno) {
		
			productDao.delete(pno);
		
	}
	public List<ProductDto> relativeList(String category){
		return productDao.relative(category);
	}
	public List<ProductDto> selectCategory(String category){
		return productDao.selectCategory(category);
	}
	public List<CategoryDto> getCategory(){
		return productDao.getCategory();
	}
//	public int getTotal() {
//		try {
//			return productDao.count();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return 0;
//		}
//	}
}