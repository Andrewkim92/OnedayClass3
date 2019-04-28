package com.day.one.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.day.one.dao.UserDao;
import com.day.one.vo.UserVO;

@Controller
@RequestMapping("/my")
public class MyController {

	@Autowired
	private UserDao userService;
	
	@RequestMapping("/info")
	public String info(UserVO vo,HttpServletResponse response, Model model,HttpSession session) {
	
		UserVO svo = (UserVO) session.getAttribute("userVO");
		UserVO resVO = userService.getVOById(svo.getId());
		
		model.addAttribute("vo", resVO);
		return "my/info.tiles";
	}
	
	@RequestMapping("/history")
	public String history() {
	
		return "my/history.tiles";
	}
	
	@RequestMapping("/history/class")
	public String historyClass() {
	
		return "my/class.tiles";
	}
	
	@RequestMapping("/history/reviews")
	public String historyReviews() {
	
		return "my/reviews.tiles";
	}
	
	@PostMapping("/updateProfile")
	public String updateProfile(UserVO vo, HttpServletResponse response, Model model,HttpSession session) throws Exception{
//		System.out.println(vo.getId());
//		System.out.println(vo.getPassword());
//		userService.update(vo);
		userService.updateInfo(vo);
		return "redirect:/my/info";
	}
	
}
