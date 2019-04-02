package com.day.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



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
	
	@RequestMapping("/events")
	public String events() {
	
		return "one/events";
	}
	
	@RequestMapping("/program")
	public String program() {
	
		return "one/program";
	}
	
	@RequestMapping("/trainers")
	public String trainers() {
	
		return "one/trainers";
	}
	
	
	
}
