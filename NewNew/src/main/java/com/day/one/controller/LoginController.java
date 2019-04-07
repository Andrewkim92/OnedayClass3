package com.day.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping("/register")
	public String index() {
	
		return "one/index";
	}
	
	@RequestMapping("/login")
	public String login() {
	
		return "one/login";
	}
	
	@RequestMapping("/join")
	public String join() {
	
		return "one/join";
	}
	
	
	
	
	
}
