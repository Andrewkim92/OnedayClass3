package com.day.one.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.day.one.service.ProgService;
import com.day.one.vo.Criteria;
import com.day.one.vo.PageDTO;
import com.day.one.vo.ProgVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/program/*")
public class ProgController {
	
	@Setter(onMethod_ = @Autowired)
	private ProgService progService;
	
	@PostMapping("/register")
	public String register(ProgVO prog, RedirectAttributes rttr) {
		rttr.addFlashAttribute("result", prog.getProgSeq());
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		List<ProgVO> programs = progService.getListWithPaging(cri);
		model.addAttribute("programs", programs);
		
		int total = progService.getTotalCount();
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageDTO);
		
		//테스트(전체조회, 전체게시물수, pageDTO)
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("getList: "+programs);
		System.out.println("getTotalCount: "+total);
		System.out.println("pageMaker: "+pageDTO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		return "program/list.tiles";
	}
	
	@GetMapping("/info")
	public String info(@RequestParam("progSeq") int progSeq, @ModelAttribute("cri") Criteria cri, Model model) {
		ProgVO program=progService.get(progSeq);
		model.addAttribute("program", program);
		
		//test
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("program: "+program);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		return "program/info.tiles";
	}

	@GetMapping("/jstest")
	public String jstest() {
		return "program/jstest";
	}
}
