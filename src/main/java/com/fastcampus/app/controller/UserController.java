package com.fastcampus.app.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringArrayPropertyEditor;
import org.springframework.core.convert.ConversionService;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fastcampus.app.domain.UserDto;
import com.fastcampus.app.domain.UserOrderDto;
import com.fastcampus.app.service.UserOrderService;
import com.fastcampus.app.service.UserService;
import com.fastcampus.app.dao.UserDao;
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserService service;
	
	@Autowired
	private UserOrderService orderService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
//	@InitBinder
//	public void toDate(WebDataBinder binder) {
//		ConversionService conversionService = binder.getConversionService();
//		//binder.registerCustomEditor(String[].class,new StringArrayPropertyEditor("#"));
//		//binder.setValidator(new UserValidator()); //UserValidator만 사용
//		//binder.addValidators(new UserValidator()); //GlobalValidator와 UserValidator를 함께 사용
//		List<Validator> validatorList = binder.getValidators();
//		System.out.println(validatorList);
//	}
	@PatchMapping("/modify")
	@ResponseBody
	public String modifyUser(@RequestBody UserDto dto) {
		System.out.println(dto);
		service.updateUser(dto);
		return "success";
	}
	@GetMapping("/myPage")
	public String myPage(HttpSession session,Model model) {
		return "myPage";
	}
	@GetMapping("/userInfo")
	@ResponseBody
	public UserDto userInfo(Principal principal) {
		UserDto dto = service.getUser(principal.getName());
		return dto;
	}
	@GetMapping("/userOrder")
	@ResponseBody
	public List<UserOrderDto> userOrder(Principal principal){
		//List<UserOrderDto> list = orderService.selectUserOrder("admin");
		List<UserOrderDto> list = orderService.selectUserOrder(principal.getName());
		System.out.println(list);
		return list;
	}
	@GetMapping("/register")
	public String add() {
		return "registerForm";
	}
	@PostMapping("/register")
	public String register(UserDto dto) { 
		String encPassword = passwordEncoder.encode(dto.getUserPwd());
		dto.setUserPwd(encPassword);
		service.insertUser(dto);
		return "index";
		
	}
	@PostMapping("/userIdChk")
	@ResponseBody
	public String memberIdCheck(@RequestBody String userId){
		
		/* logger.info("memberIdChk() 진입"); */
		String str = userId.substring(0, userId.length() - 1);

		System.out.println(str);		
		int result = service.idCheck(str);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}		
		
	}
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) throws Exception {
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		System.out.println(email);
		System.out.println(checkNum); 	
		String setFrom = "zkxmsj@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
	}
	

		
}
//	private boolean isValid(User user) {
//		return true;
//	}

