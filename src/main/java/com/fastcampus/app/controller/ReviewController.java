package com.fastcampus.app.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fastcampus.app.domain.CommentDto;
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
	public String writeReview(@PathVariable int orderno, @RequestBody ReviewDto dto,Principal principal) {
		dto.setCommenter(principal.getName());
		service.insert(dto,orderno);
		return "success";
	}
	@PatchMapping("/review/{cno}")
	@ResponseBody
	public String modifyComment(@PathVariable int cno,@RequestBody ReviewDto dto,Principal principal) {
		
		dto.setCommenter(principal.getName());
		System.out.println(dto);
		service.update(dto);
		
		return "MODIFY_OK";
		
	}
	@DeleteMapping("/review/{cno}")
	@ResponseBody
	public String remove(@PathVariable int cno,Integer pno,Principal principal){
		service.delete(cno);
		return "DEL_OK";
		
	}
}
