package com.day.one.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.day.one.dao.ProgDao;
import com.day.one.vo.ProgVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/program")
public class ProgController {
	
	@Setter(onMethod_ = @Autowired)
	private ProgDao progService;
	
	@PostMapping("/register")
	public String register(ProgVO prog, RedirectAttributes rttr) {
		
//		progService.register(prog); 처리 필요
		
		rttr.addFlashAttribute("result", prog.getProgSeq());
		
		// 다시 list로 가서 등록됐는지 보여줌
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String list() {
		
		return "program/list.tiles";
	}
	
	@GetMapping("/info")
	public String info() {
		
		return "program/info.tiles";
	}
	
}
