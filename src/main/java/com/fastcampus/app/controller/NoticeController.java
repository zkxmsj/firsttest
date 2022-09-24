package com.fastcampus.app.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fastcampus.app.domain.NoticeDto;
import com.fastcampus.app.domain.CommentDto;
import com.fastcampus.app.domain.CustomUser;
import com.fastcampus.app.service.NoticeService;
import com.fastcampus.app.service.CommentService;
import com.fastcampus.app.domain.PageHandler;
import com.fastcampus.app.domain.SearchCondition;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	@Autowired
	CommentService commentService;
	
	
	@GetMapping("/list")
	public String Boardlist(SearchCondition sc,Model m) {
		ArrayList<NoticeDto> list = (ArrayList<NoticeDto>) noticeService.getBoardList(sc);
		int total = noticeService.getTotal(sc);
		PageHandler pageHandler = new PageHandler(sc,total);
		m.addAttribute("list",list);
		m.addAttribute("pageHandler",pageHandler);
		m.addAttribute("sc",sc);
		System.out.println(sc);
		System.out.println(pageHandler);
		return "NoticeList";
	}
//	public String list(HttpServletRequest request,Model m) {
//		if(!loginCheck(request))
//			return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
//		
//			ArrayList<NoticeDto> list = (ArrayList<NoticeDto>) noticeService.getBoardList();
//			m.addAttribute("list",list);
//		return "boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
//	}
	@GetMapping("/noticeDetail")
	public String detail(int bno,Model m) {
			NoticeDto NoticeDto = noticeService.selectBoard(bno);
			m.addAttribute("NoticeDto",NoticeDto);
		return "NoticeDetail";
	}
	@GetMapping("/registNotice")
	public String registForm() {
		return "registNoticeForm";
	}
	@PostMapping("/registNotice")
	public String registBoard(NoticeDto NoticeDto){
		noticeService.registBoard(NoticeDto);
		return "redirect:/notice/list";
	}
	@GetMapping("/modifyNoticeForm")
	public String modifyBoardForm(int bno,Model m) {
		NoticeDto NoticeDto = noticeService.selectBoard(bno);
		m.addAttribute("NoticeDto",NoticeDto);
		return "modifyNoticeForm";
	}
	@PostMapping("/modifyNotice")
	public String modifyBoard(NoticeDto NoticeDto) {
		 noticeService.modifyBoard(NoticeDto);
		 System.out.println(NoticeDto);
		 return "redirect:/notice/list";
	}
	@GetMapping("/deleteNotice")
	public String deleteBoard(int bno) {
		noticeService.deleteBoard(bno);
		return "redirect:/notice/list";
	}
}