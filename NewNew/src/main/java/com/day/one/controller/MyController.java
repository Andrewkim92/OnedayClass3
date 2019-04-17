package com.day.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.day.one.vo.UserVO;

@Controller
@RequestMapping("/my")
public class MyController {

	@RequestMapping("/info")
	public String info() {
	
		return "my/info.tiles";
	}
	
}
