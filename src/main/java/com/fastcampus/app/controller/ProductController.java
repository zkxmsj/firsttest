package com.fastcampus.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fastcampus.app.service.ProductService;

@Controller
@RequestMapping("/product")
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
		model.addAttribute("product",service.selectProduct(pno));
		return "product";
	}
}
