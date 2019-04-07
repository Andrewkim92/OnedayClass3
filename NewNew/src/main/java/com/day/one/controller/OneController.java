package com.day.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//test.....jjj

@Controller
@RequestMapping("/*")
public class OneController {

	@RequestMapping("/")
	public String index() {
	
		return "one/index";
	}
	
	@RequestMapping("/about")
	public String about() {
	
		return "one/about";
	}
	
	@RequestMapping("/contact")
	public String contact() {
	
		return "one/contact";
	}
	
	@RequestMapping("/board")
	public String board() {
	
		return "one/board";
	}
	
	@RequestMapping("/program")
	public String program() {
	
		return "one/program";
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
