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
import com.fastcampus.app.domain.ProductDto;
import com.fastcampus.app.domain.UserDto;
import com.fastcampus.app.service.CartService;
import com.fastcampus.app.service.UserOrderService;
import com.fastcampus.app.service.UserService;

@Controller
public class OrderController {
	@Autowired
	CartService cartService;
	@Autowired
	UserService userService;
	@Autowired
	UserOrderService orderService;
	
	
	@GetMapping("/order")
	public String orderPage(HttpSession session,Model model) {
		session.setAttribute("userid","admin");
		String userId = (String)session.getAttribute("userid");
		int total;
		try {
			total = cartService.getTotal(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			total=0;
		}
		List<CartDto> list = cartService.getCart(userId);
		model.addAttribute("user",userService.getUser(userId));
		model.addAttribute("total",total);
		model.addAttribute("list",list);
		
		return "order";
	}
	@GetMapping("/orderComplete")
	public String orderComplete() {
		return "orderComplete";
	}
	
	@PostMapping("/order")
	public String getOrder(OrderDto dto) {
		System.out.println("컨트롤러 동작");
		System.out.println(dto);
		orderService.insertOrder(dto);
		return "redirect:/orderComplete";
	}  
	
}
