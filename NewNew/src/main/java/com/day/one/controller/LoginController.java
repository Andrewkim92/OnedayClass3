package com.day.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping("/register")
	public String register() {
	
		return "login/register";
	}
	
	@RequestMapping("/login")
	public String login() {
	
		return "login/login";
	}
	
	@RequestMapping("/findPassword")
	public String findPassword() {
	
		return "login/findPassword";
	}
}
