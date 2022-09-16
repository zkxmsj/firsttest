package com.fastcampus.app.controller;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fastcampus.app.service.UserService;
import com.fastcampus.app.dao.UserDao;
import com.fastcampus.app.domain.UserDto;

@Controller
@RequestMapping
public class LoginController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/login")
	public String loginForm(HttpServletRequest request) {
		String uri = request.getHeader("Referer");
	    if (uri != null && !uri.contains("/login")) {
	        request.getSession().setAttribute("prevPage", uri);
	    }
	    System.out.println(uri);
		return "loginForm";
		
	}

	@PostMapping("/login")
	public String login(String id, String pwd,String toURL, boolean rememberId, HttpServletResponse response,HttpSession session) throws Exception {
		System.out.println("id="+id);
		System.out.println("pwd="+pwd);
		System.out.println("rememberId="+rememberId);
		
		// 1. id와 pwd를 확인
		if(!loginCheck(id, pwd)) {
			// 2-1   일치하지 않으면, loginForm으로 이동
			String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8");
			Cookie cookie = new Cookie("id", id); // ctrl+shift+o 자동 import
			cookie.setMaxAge(0); // 쿠키를 삭제
//		       2. 응답에 저장
			response.addCookie(cookie);
			return "redirect:/member/login?msg="+msg;
			
		
		// 2-2. id와 pwd가 일치하면,
		}if(rememberId) {
		//     1. 쿠키를 생성
			Cookie cookie = new Cookie("id", id); // ctrl+shift+o 자동 import
//		       2. 응답에 저장
			response.addCookie(cookie);
		} else {
// 		       1. 쿠키를 삭제
			Cookie cookie = new Cookie("id", id); // ctrl+shift+o 자동 import
			cookie.setMaxAge(0); // 쿠키를 삭제
//		       2. 응답에 저장
			response.addCookie(cookie);
		}
		session.setAttribute("id",id);
		System.out.println(session.getAttribute("id"));

//		3. 홈으로 이동
		if(session.getAttribute("prevPage")==null)
		return "index";
		else
		return "redirect:"+session.getAttribute("prevPage");
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	        
		 session.invalidate();
		return "redirect:/";
	}

	private boolean loginCheck(String id, String pwd) {
		UserDto user = userDao.selectUser(id);
		System.out.println(user);
		if(user==null) return false;
		
		
		return user.getUserPwd().equals(pwd);
	}
}