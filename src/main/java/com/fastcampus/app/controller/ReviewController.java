package com.fastcampus.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fastcampus.app.domain.ReviewDto;
import com.fastcampus.app.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService service;
	
	
	@GetMapping("/review/{pno}")
	@ResponseBody
	public List<ReviewDto> getReview(@PathVariable Integer pno) {
		List<ReviewDto> list = service.selectAll(pno);
		System.out.println(list);
		return list;
	}
	@PostMapping("/review/{orderno}")
	@ResponseBody
	public String writeReview(@PathVariable int orderno, @RequestBody ReviewDto dto) {
		dto.setCommenter("admin");
		service.insert(dto,orderno);
		return "success";
	}
}
