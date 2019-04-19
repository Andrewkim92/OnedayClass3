package com.day.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.day.one.service.BoardService;
import com.day.one.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private BoardService service;
	
	@RequestMapping(value="/classBoardWrite")
	public String index() {
		
		return "board/tab.tiles";
	}
	
	@RequestMapping(value="/tab1")
	public String register1() {
		
		return "board/tab1";
	}
	
	@RequestMapping(value="/tab2")
	public String register2() {
		
		return "board/tab2";
	}
	
	@RequestMapping(value="/tab3")
	public String register3() {
		
		return "board/tab3";
	}
	
	@RequestMapping(value="/classInfo")
	public String classInfo() {
	
		return "board/classInfo.tiles";
	}
	
	@PostMapping("/register")
	public String register(BoardVO boardVO, RedirectAttributes rttr) {

      service.registerBoard(boardVO);

      return "redirect:/board/list";
   }
}
