package com.day.one.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.day.one.service.AdminAnalysisService;
import com.day.one.vo.ProgVO;

import lombok.Setter;

@Controller
@RequestMapping("/admin/*")
public class AdminAnalysisController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminAnalysisService adminService;
	
	@GetMapping("/chartTest")
	public String registerGet(Model model) {
		
		List<ProgVO> firstToTenth = adminService.getFirstToTenth();
		/*
		 * ProgVO prog1=firstToTenth.get(0); ProgVO prog2=firstToTenth.get(1); ProgVO
		 * prog3=firstToTenth.get(2); ProgVO prog4=firstToTenth.get(3); ProgVO
		 * prog5=firstToTenth.get(4); ProgVO prog6=firstToTenth.get(5);
		 */
		
		System.out.println("firstToTenth: "+firstToTenth); 
		
		/*
		 * for( ProgVO test : firstSecond) { System.out.println("@@@@@@@@@@");
		 * System.out.println("test:"+test); System.out.println("@@@@@@@@@@"); }
		 */
		
		model.addAttribute("firstToTenth", firstToTenth);

		return "admin/chartTest.tiles";
	}
	
}
