package com.day.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.day.one.vo.UserVO;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping("/register")
	public String register() {
	
		return "login/register.tiles";
	}
	
	@PostMapping("/doRegister")
	public String doRegister(UserVO vo) {
	
		System.out.println(vo.getId());
		System.out.println(vo.getPassword());
		
		return "redirect:/";
	}
	
	@RequestMapping("/findPassword")
	public String findPassword() {
	
		return "login/findPassword.tiles";
	}
}
