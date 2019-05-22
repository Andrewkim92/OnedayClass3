package com.day.one.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String ReviewList(ReviewVO vo, Model model) {
		model.addAttribute("reviewList",reviewService.listAll(vo.getProgram_progSeq()));
		model.addAttribute("count",reviewService.count(vo.getProgram_progSeq()));
		return "review/list.tiles";
	};
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String ReviewWriteGET(ReviewVO vo, Model model) {
		model.addAttribute("progSeq",vo.getProgram_progSeq());
		model.addAttribute("userNumber",vo.getUser_userNumber());
		return "review/write.tiles";
	};
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String ReviewWritePOST(ReviewVO vo, Model model) {
		reviewService.insert(vo);
		model.addAttribute("reviewList",reviewService.listAll(vo.getProgram_progSeq()));
		model.addAttribute("count",reviewService.count(vo.getProgram_progSeq()));
		return "review/list.tiles";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String ReviewUpdateGET(ReviewVO vo, Model model) {
		model.addAttribute("progSeq",vo.getProgram_progSeq());
		model.addAttribute("userNumber",vo.getUser_userNumber());
		return "review/update.tiles";
	};
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String ReviewUpdatePOST(ReviewVO vo, Model model) {
		reviewService.update(vo);
		model.addAttribute("reviewList",reviewService.listAll(vo.getProgram_progSeq()));
		model.addAttribute("count",reviewService.count(vo.getProgram_progSeq()));
		return "review/list.tiles";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String ReviewDeletePOST(ReviewVO vo, Model model) {
		reviewService.delete(vo);
		model.addAttribute("reviewList",reviewService.listAll(vo.getProgram_progSeq()));
		model.addAttribute("count",reviewService.count(vo.getProgram_progSeq()));
		return "review/list.tiles";
	}
	
}
