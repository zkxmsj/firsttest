package com.fastcampus.app.controller;

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
	public ResponseEntity addCart(@RequestBody CartDto dto,HttpSession session) {
		session.setAttribute("userid","admin");
		dto.setUserId((String)session.getAttribute("userid"));
		service.insertCart(dto);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	@GetMapping("/cart")
	public String cart(HttpSession session,Model model) {
		session.setAttribute("userid","admin");
		int total = service.getTotal((String)session.getAttribute("userid"));
		List<CartDto> list = service.getCart((String)session.getAttribute("userid"));
		model.addAttribute("total",total);
		model.addAttribute("list",list);
		return "cart";
	}
	@GetMapping("/cart/user")
	@ResponseBody
	public ResponseEntity cartList(HttpSession session,Model model) {
		session.setAttribute("userid","admin");
		List<CartDto> list = service.getCart((String)session.getAttribute("userid"));
		
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	@DeleteMapping("/cart/{pno}/{cno}")
	@ResponseBody
	public String deleteCart(@PathVariable int pno,@PathVariable int cno,HttpSession session) {
		service.deleteCart(cno,pno,(String)session.getAttribute("userid"));
		return "삭제 완료";
		
	}
	
}
