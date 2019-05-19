package com.day.one.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.day.one.dao.ReviewDao;
import com.day.one.vo.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewDao reviewService;

	@RequestMapping(value="/list")
	public String ReviewList(@RequestParam int progSeq, Model model) {
		model.addAttribute("reviewList",reviewService.listAll(progSeq));
		return "review/list.tiles";
	};
	
}
