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
	public String info(UserVO vo,HttpSession session) {
	
		return "my/info.tiles";
	}
	
	@RequestMapping("/hostRegister")
	public String hostRegister(UserVO vo,HttpSession session) {
	
		return "my/hostRegister.tiles";
	}
	
	@RequestMapping("/hostRegisterTerm")
	public String hostRegisterTerm(UserVO vo,HttpSession session) {
	
		return "my/hostRegisterTerm.tiles";
	}
	
	@RequestMapping("/history")
	public String history(UserVO vo,HttpSession session) {
	
		return "my/history.tiles";
	}
	
	@RequestMapping("/history/class")
	public String historyClass(UserVO vo,HttpSession session) {
	
		return "my/class.tiles";
	}
	
	@RequestMapping("/history/reviews")
	public String historyReviews(UserVO vo,HttpSession session) {
	
		return "my/reviews.tiles";
	}
	
	@PostMapping("/updateProfile")
	public String updateProfile(UserVO vo, HttpServletResponse response, Model model,HttpSession session) {

		System.out.println(vo.getId());
		System.out.println(vo.getName());
		userService.update(vo);
		
		UserVO tmpVO = (UserVO) session.getAttribute("userVO");
		tmpVO.setId(vo.getId());
		tmpVO.setName(vo.getName());
		session.setAttribute("userVO", tmpVO);
		
		return "redirect:/my/info";
	}
	
}
