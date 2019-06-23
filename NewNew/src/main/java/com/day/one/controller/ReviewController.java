package com.day.one.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.day.one.dao.ReviewDao;
import com.day.one.dao.ReviewLikeDao;
import com.day.one.common.ReviewPager;
import com.day.one.dao.ProgDao;
import com.day.one.service.ReviewLikeService;
import com.day.one.service.ReviewService;
import com.day.one.service.ProgService;
import com.day.one.vo.ReviewLikeVO;
import com.day.one.vo.ReviewVO;
import com.day.one.vo.ProgVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;
	
	@Setter(onMethod_ = @Autowired)
	private ReviewLikeService ReviewLikeService;
	
	@Setter(onMethod_ = @Autowired)
	private ProgService progService;
	
	@RequestMapping(value="/list")
	public String ReviewList(@RequestParam(defaultValue="1") int curPage, ReviewVO vo, HttpServletRequest request, Model model) {
		
		//페이징 처리
		// 전체 리뷰 개수
		int reviewCount = reviewService.count(vo.getProgram_progSeq());
		ReviewPager pager = new ReviewPager(reviewCount, curPage);
		vo.setStart(pager.getStartPage());
		vo.setEnd(pager.getEndPage());
		List<ReviewVO> allList = (List<ReviewVO>) reviewService.getAll(vo);
	
		ProgVO pv = progService.get(vo.getProgram_progSeq());
		
		HashMap<Integer,String> nameList = new HashMap<Integer,String>();
		for(ReviewVO rv : allList) {
			nameList.put(rv.getUser_userNumber(),reviewService.readUserName(rv.getUser_userNumber()));
		}
		
		model.addAttribute("reviewList",allList);
		model.addAttribute("progName",pv.getProgName());
		model.addAttribute("count",reviewCount);
		model.addAttribute("rateAvg",reviewService.rateAvg(vo.getProgram_progSeq()));
		model.addAttribute("nameList",nameList);
		model.addAttribute("reviewPager",pager);
		model.addAttribute("program_progSeq",vo.getProgram_progSeq());
		return "review/list.tiles";
	};
	
	@RequestMapping(value="/myReview")
	public String MyReview(ReviewVO vo, Model model) {
		List<ReviewVO> myList = (List<ReviewVO>) reviewService.getMy(vo.getUser_userNumber());
		model.addAttribute("myReview",myList);
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
		List<ReviewVO> myList = (List<ReviewVO>) reviewService.getMy(vo.getUser_userNumber());
		model.addAttribute("myReview",myList);
		return "review/myReview.tiles";
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
	

	@RequestMapping(value = "/reviewLike", method = RequestMethod.POST)
	@ResponseBody
	public int ReviewLikeCountUpdate(ReviewLikeVO lvo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int lu = Integer.parseInt(request.getParameter("likedUser"));
		lvo.setLikedUser_userNumber(lu);
		int ru = Integer.parseInt(request.getParameter("reviewUser"));
		lvo.setUser_userNumber(ru);
		int ps = Integer.parseInt(request.getParameter("progSeq"));
		lvo.setProgram_progSeq(ps);
		
		ReviewVO rVo = new ReviewVO();
		rVo.setUser_userNumber(ru);
		rVo.setProgram_progSeq(ps);
		
		if(ReviewLikeService.readOne(lvo) == null) {
			ReviewLikeService.register(lvo);
			rVo.setLikeCount(ReviewLikeService.count(lvo));
			reviewService.likeCount(rVo);
		} else {
			ReviewLikeService.remove(lvo);
			rVo.setLikeCount(ReviewLikeService.count(lvo));
			reviewService.likeCount(rVo);
		};
		
		return rVo.getLikeCount();
	}
	
	@RequestMapping(value = "/writeCheck", method = RequestMethod.GET)
	@ResponseBody
	public int ReviewWriteCheck(ReviewVO vo, Model model) {
		if(reviewService.readOne(vo) != null) {
			return 0;
		} else {
			return 1;
		}
	}
}
