package com.fastcampus.app.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fastcampus.app.domain.CommentDto;
import com.fastcampus.app.service.CommentService;

@RestController
public class CommentController {
	@Autowired
	CommentService commentService;
	
	@DeleteMapping("/comments/{cno}")
	public String remove(@PathVariable int cno,Integer bno,Principal principal){
		String commenter=principal.getName();
		commentService.removeCnt(cno, bno, commenter);
		return "DEL_OK";
		
	}
	
	@GetMapping("/comments")
	public List<CommentDto> commentList(int bno,HttpSession session){
		List<CommentDto> list = commentService.getList(bno);
		return list;
	}
	@PostMapping("/comments")
	public String writeComment(@RequestBody CommentDto dto,int bno,Principal principal){
		dto.setCommenter(principal.getName());
		dto.setBno(bno);
		System.out.println(dto);
		commentService.write(dto);
		return "WRT_OK";
	}
	@PatchMapping("/comments/{cno}")
	public String modifyComment(@PathVariable int cno,@RequestBody CommentDto dto,Principal principal) {
		dto.setCommenter(principal.getName());
		commentService.update(dto);
		
		return "MODIFY_OK";
		
	}
}
