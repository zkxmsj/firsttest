package com.fastcampus.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fastcampus.app.domain.ProductDto;
import com.fastcampus.app.service.ProductService;

@Controller
@RequestMapping
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
	@GetMapping("/product")
	public String productDetail(Model model,int pno) {
		ProductDto dto = service.selectProduct(pno);
		model.addAttribute("product",dto);
		List<ProductDto> list = service.relativeList(dto.getCategory());
		model.addAttribute("list",list);
		return "product";
	}
}
