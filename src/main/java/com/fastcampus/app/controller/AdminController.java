package com.fastcampus.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fastcampus.app.domain.UserDto;
import com.fastcampus.app.domain.UserOrderDto;
import com.fastcampus.app.service.UserOrderService;
import com.fastcampus.app.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UserService userService;
	@Autowired
	UserOrderService orderService;

	@GetMapping("/adminPage")
	String MemberList(Model model) {		
		return "adminPage";
	}
	@GetMapping("/orderList")
	@ResponseBody
	public List<UserOrderDto> userOrder(HttpSession session){
		//List<UserOrderDto> list = orderService.selectUserOrder("admin");
		List<UserOrderDto> list = orderService.selectAll();
		return list;
	}
	
	@PutMapping("/shipping/{orderno}")
	@ResponseBody
	public String shippingOrder(@PathVariable int orderno) {
		orderService.shipping(orderno);
		return "success";
	}
	
}
