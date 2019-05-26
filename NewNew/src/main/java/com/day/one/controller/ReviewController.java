package com.day.one.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.day.one.dao.ReviewDao;
import com.day.one.service.ReviewService;
import com.day.one.vo.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;

	@RequestMapping(value="/list")
	public String ReviewList(ReviewVO vo, Model model) {
		model.addAttribute("reviewList",reviewService.getAll(vo.getProgram_progSeq()));
		model.addAttribute("count",reviewService.count(vo.getProgram_progSeq()));
		model.addAttribute("rateAvg",reviewService.rateAvg(vo.getProgram_progSeq()));
		return "review/list.tiles";
	};
	
	@RequestMapping(value="/myReview")
	public String MyReview(ReviewVO vo, Model model) {
		model.addAttribute("myReview",reviewService.getMy(vo.getUser_userNumber()));
		return "review/myReview.tiles";
	};
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String ReviewWriteGET(ReviewVO vo, Model model) {
		model.addAttribute("progSeq",vo.getProgram_progSeq());
		model.addAttribute("userNumber",vo.getUser_userNumber());
		return "review/write.tiles";
	};
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String ReviewWritePOST(ReviewVO vo, Model model) {
		reviewService.register(vo);
		model.addAttribute("reviewList",reviewService.getAll(vo.getProgram_progSeq()));
		model.addAttribute("count",reviewService.count(vo.getProgram_progSeq()));
		return "review/list.tiles";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String ReviewUpdateGET(ReviewVO vo, Model model) {
		model.addAttribute("readOne",reviewService.readOne(vo));
		return "review/update.tiles";
	};
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String ReviewUpdatePOST(ReviewVO vo, Model model) {
		reviewService.modify(vo);
		model.addAttribute("myReview",reviewService.getMy(vo.getUser_userNumber()));
		return "review/myReview.tiles";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String ReviewDeletePOST(ReviewVO vo, Model model) {
		reviewService.remove(vo);
		model.addAttribute("myReview",reviewService.getMy(vo.getUser_userNumber()));
		return "review/myReview.tiles";
	}
	
	@RequestMapping(value = "/LikeCountUpdate", method = RequestMethod.POST)
	public void ReviewLikeCountUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String a = request.getParameter("userNumber");
		String b = request.getParameter("progSeq");
		String c = request.getParameter("likedUser");
		System.out.println(a+b+c);
	}
	
}
