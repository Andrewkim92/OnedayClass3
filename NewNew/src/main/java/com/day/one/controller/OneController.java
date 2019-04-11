package com.day.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class OneController {

	@RequestMapping("/")
	public String index() {
	
		return "one/index.tiles";
	}
	
	@RequestMapping("/about")
	public String about() {
	
		return "one/about.tiles";
	}
	
	@RequestMapping("/contact")
	public String contact() {
	
		return "one/contact.tiles";
	}
	
	@RequestMapping("/board")
	public String board() {
	
		return "one/board.tiles";
	}
	
	@RequestMapping("/program")
	public String program() {
	
		return "one/program.tiles";
	}
	
	@RequestMapping("/join")
	public String join() {
	
		return "one/join.tiles";
	}
	
	@RequestMapping("/login")
	public String login() {
	
		return "login/login.tiles";
	}
}
