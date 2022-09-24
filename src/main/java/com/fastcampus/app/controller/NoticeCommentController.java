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
import com.fastcampus.app.domain.NoticeCommentDto;
import com.fastcampus.app.service.CommentService;
import com.fastcampus.app.service.NoticeCommentService;

@RestController
public class NoticeCommentController {
	@Autowired
	NoticeCommentService commentService;
	
	@DeleteMapping("/noticecomments/{cno}")
	public String remove(@PathVariable int cno,Integer bno,Principal principal){
		String commenter=principal.getName();
		commentService.removeCnt(cno, bno, commenter);
		return "DEL_OK";
		
	}
	
	@GetMapping("/noticecomments")
	public List<NoticeCommentDto> commentList(int bno,HttpSession session){
		List<NoticeCommentDto> list = commentService.getList(bno);
		return list;
	}
	@PostMapping("/noticecomments")
	public String writeComment(@RequestBody NoticeCommentDto dto,int bno,Principal principal){
		dto.setCommenter(principal.getName());
		dto.setBno(bno);
		System.out.println(dto);
		commentService.write(dto);
		return "WRT_OK";
	}
	@PatchMapping("/noticecomments/{cno}")
	public String modifyComment(@PathVariable int cno,@RequestBody NoticeCommentDto dto,Principal principal) {
		dto.setCommenter(principal.getName());
		commentService.update(dto);
		
		return "MODIFY_OK";
		
	}
}
