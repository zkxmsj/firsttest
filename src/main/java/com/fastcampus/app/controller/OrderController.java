package com.fastcampus.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.fastcampus.app.domain.CartDto;
import com.fastcampus.app.domain.OrderDto;
import com.fastcampus.app.service.CartService;
import com.fastcampus.app.service.UserService;

@Controller
public class OrderController {
	@Autowired
	CartService cartService;
	@Autowired
	UserService userService;
	
	@GetMapping("/order")
	public String orderPage(HttpSession session,Model model) {
		session.setAttribute("userid","admin");
		String userId = (String)session.getAttribute("userid");
		int total = cartService.getTotal(userId);
		List<CartDto> list = cartService.getCart(userId);
		model.addAttribute("user",userService.getUser(userId));
		model.addAttribute("total",total);
		model.addAttribute("list",list);
		
		return "order";
	}
	
	@PostMapping("/order")
	public void getOrder(OrderDto dto) {
		System.out.println("컨트롤러 동작");
		System.out.println(dto);
	}  
	
}
