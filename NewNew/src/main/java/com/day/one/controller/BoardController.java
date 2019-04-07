package com.day.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping(value="/classBoardWrite")
	public String index() {
	
		return "board/classBoardWrite";
	}
	
	@RequestMapping(value="/classInfo")
	public String classInfo() {
	
		return "board/classInfo";
	}
	
	
	
	
	
	
	
	
	
}//class end
