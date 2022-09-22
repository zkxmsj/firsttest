package com.fastcampus.app.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fastcampus.app.domain.CategoryDto;
import com.fastcampus.app.domain.ProductDto;
import com.fastcampus.app.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService service;
	
	@GetMapping("/products")
	public String productList(Model model) {
		model.addAttribute("list",service.getProductList());
		System.out.println(service.getProductList());
		return "products";
	}
	@GetMapping("/productsSearch")
	@ResponseBody
	public ResponseEntity productList(String category) {
		System.out.println(category);
		List<ProductDto> list = service.selectCategory(category);
		
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	@GetMapping("/product/{pno}")
	@ResponseBody
	public ProductDto productDetail(@PathVariable int pno) {
		ProductDto dto = service.selectProduct(pno);
		
		return dto;
	}
	@GetMapping("/product")
	public String productPage(int pno){
		return "product";
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@GetMapping("/getCategory")
	@ResponseBody
	public List<CategoryDto> getCategory(){
		List<CategoryDto> list = service.getCategory();
		return list;
	}
	@GetMapping("/relative/{pno}")
	@ResponseBody
	public List<ProductDto> getRelative(@PathVariable int pno){
		ProductDto dto = service.selectProduct(pno);
		String category = dto.getCategory();
		List<ProductDto> list = service.relativeList(category);
		System.out.println(list.get(0).getUploadPath());
		System.out.println(list.get(0).getCategory());
		return list;
	}
	@GetMapping("/searchProduct")
	@ResponseBody
	public List<ProductDto> searchProduct(String productName){
		System.out.println(productName);
		List<ProductDto> list = service.searchProduct(productName);
		System.out.println(list);
		return list;
		
	}
	@GetMapping("/productList")
	@ResponseBody
	public List<ProductDto> productList(){
		List<ProductDto> list = service.getProductList();
		return list;
	}
}
