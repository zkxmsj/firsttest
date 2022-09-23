package com.fastcampus.app.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fastcampus.app.domain.CartDto;
import com.fastcampus.app.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	@PostMapping("/cart")
	@ResponseBody
	public ResponseEntity addCart(@RequestBody CartDto dto,Principal principal) {
		dto.setUserId(principal.getName());
		service.insertCart(dto);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	@GetMapping("/cart")
	public String cart(Principal principal,Model model) {
		int total=0;
		try{
			total = service.getTotal(principal.getName());
		}
		catch(Exception e) {
			total=0;
		}
		List<CartDto> list = service.getCart(principal.getName());
		model.addAttribute("total",total);
		model.addAttribute("list",list);
		return "cart";
	}
	@GetMapping("/cart/user")
	@ResponseBody
	public ResponseEntity cartList(Principal principal,Model model) {
		List<CartDto> list = service.getCart(principal.getName());
		
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	@DeleteMapping("/cart/{pno}/{cno}")
	@ResponseBody
	public String deleteCart(@PathVariable int pno,@PathVariable int cno,Principal principal) {
		service.deleteCart(cno,pno,principal.getName());
		return "삭제 완료";
		
	}
	
}
