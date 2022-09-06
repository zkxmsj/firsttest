package com.fastcampus.app.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringArrayPropertyEditor;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fastcampus.app.domain.User;
import com.fastcampus.app.dao.UserDao;
@Controller
@RequestMapping("/register")
public class RegisterController {
	@Autowired
	UserDao userDao;
	
	final int FAIL = 0;
	
	@InitBinder
	public void toDate(WebDataBinder binder) {
		ConversionService conversionService = binder.getConversionService();
		//binder.registerCustomEditor(String[].class,new StringArrayPropertyEditor("#"));
		//binder.setValidator(new UserValidator()); //UserValidator만 사용
		//binder.addValidators(new UserValidator()); //GlobalValidator와 UserValidator를 함께 사용
		List<Validator> validatorList = binder.getValidators();
		System.out.println(validatorList);
	}
	@GetMapping("/add")
	public String add() {
		return "registerForm";
	}
	@PostMapping("/add")
	public String save(@Valid User user,BindingResult result,Model m) throws UnsupportedEncodingException {
		System.out.println(result);
		//수동 검증 - Validator를 직접 생성하고, validate()를 직접 호출.
//		UserValidator userValidator = new UserValidator();
//		userValidator.validate(user,result);
		
		if(result.hasErrors()) {
			return "registerForm";
		}
		int rowCnt = userDao.insertUser(user);
		System.out.println(user);
		System.out.println(rowCnt);
		if(rowCnt==FAIL)
		return "registerForm";
		
		return "registerInfo";
	}
//	private boolean isValid(User user) {
//		return true;
//	}
}
