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

import com.fastcampus.app.domain.BoardDto;
import com.fastcampus.app.domain.CommentDto;
import com.fastcampus.app.domain.CustomUser;
import com.fastcampus.app.service.BoardService;
import com.fastcampus.app.service.CommentService;
import com.fastcampus.app.domain.PageHandler;
import com.fastcampus.app.domain.SearchCondition;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService boardService;
	@Autowired
	CommentService commentService;
	
	
	@GetMapping("/list")
	public String Boardlist(SearchCondition sc,Model m) {
		ArrayList<BoardDto> list = (ArrayList<BoardDto>) boardService.getBoardList(sc);
		int total = boardService.getTotal(sc);
		PageHandler pageHandler = new PageHandler(sc,total);
		m.addAttribute("list",list);
		m.addAttribute("pageHandler",pageHandler);
		m.addAttribute("sc",sc);
		System.out.println(sc);
		System.out.println(pageHandler);
		return "boardList";
	}
//	public String list(HttpServletRequest request,Model m) {
//		if(!loginCheck(request))
//			return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
//		
//			ArrayList<BoardDto> list = (ArrayList<BoardDto>) boardService.getBoardList();
//			m.addAttribute("list",list);
//		return "boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
//	}
	@GetMapping("/boardDetail")
	public String detail(int bno,Model m) {
			BoardDto boardDto = boardService.selectBoard(bno);
			m.addAttribute(boardDto);
		return "boardDetail";
	}
	@GetMapping("/registBoard")
	public String registForm() {
		return "registBoardForm";
	}
	@PostMapping("/registBoard")
	public String registBoard(BoardDto boardDto){
		boardService.registBoard(boardDto);
		return "redirect:/board/list";
	}
	@GetMapping("/modifyBoardForm")
	public String modifyBoardForm(int bno,Model m) {
		BoardDto boardDto = boardService.selectBoard(bno);
		m.addAttribute(boardDto);
		System.out.println(boardDto);
		return "modifyBoardForm";
	}
	@PostMapping("/modifyBoard")
	public String modifyBoard(BoardDto boardDto) {
		System.out.println(boardDto);
		 boardService.modifyBoard(boardDto);
		 return "redirect:/board/list";
	}
	@GetMapping("/deleteBoard")
	public String deleteBoard(int bno) {
		boardService.deleteBoard(bno);
		return "redirect:/board/list";
	}

	private boolean loginCheck(HttpServletRequest request) {
		// 1. 세션을 얻어서
		HttpSession session = request.getSession();
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환
		
		
		return session.getAttribute("id")!=null;
	}
}