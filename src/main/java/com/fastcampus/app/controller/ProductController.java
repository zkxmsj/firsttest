package com.fastcampus.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@GetMapping("/product")
	public String productDetail(Model model,int pno) {
		ProductDto dto = service.selectProduct(pno);
		model.addAttribute("product",dto);
		List<ProductDto> list = service.relativeList(dto.getCategory());
		model.addAttribute("list",list);
		return "product";
	}
}
