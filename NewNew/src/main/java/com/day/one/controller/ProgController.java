package com.day.one.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.day.one.service.ProgService;
import com.day.one.service.ReviewService;
import com.day.one.vo.Criteria;
import com.day.one.vo.PageDTO;
import com.day.one.vo.ProgVO;
import com.day.one.vo.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/program/*")
public class ProgController {

	@Setter(onMethod_ = @Autowired)
	private ProgService progService;
	
	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@GetMapping("/register")
	public String registerGet(Model model) {
		// session.setAttribute("userVO", vo);
		model.addAttribute("prog", new ProgVO());
		return "program/register.tiles";
	}

	@PostMapping("/register")
	public String registerPost(Model model, @Valid @ModelAttribute("prog") ProgVO prog,
			/* MultipartFile file, */ BindingResult result) throws IOException {
		System.out.println("@@@@@@@@@@@@@진입@@@@@@@@@@@@@@");

		if(result.hasErrors()) {
    		//form에 에러가 있으면
			System.out.println("@@@@@@@@@@@@@!!!에러!!!@@@@@@@@@@@@@@");
    		return "program/register.tiles";
    	}else {
    		System.out.println("");
    		System.out.println("@@@@@@@@@@@@@넣는중넣는중넣는중@@@@@@@@@@@@@@");
    		// 로그인한유저의 넘버가 넘어와야 하는데 없으니 하드코딩
    		prog.setUser_userNumber("10");
    		System.out.println("프로그램 : " + prog.toString());
    		progService.insert(prog);
    		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    		System.out.println("");
    		return "program/list.tiles";
    	}
		
		/*
		 * System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		 * System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		 * System.out.println("savedName : " + file.getOriginalFilename());
		 * System.out.println("size : " + file.getSize());
		 * System.out.println("content type : " + file.getContentType()); UUID uid =
		 * UUID.randomUUID(); String savedName = uid + "_" + file.getOriginalFilename();
		 * String savedPath = uploadPath + UploadFileUtils.calcPath(uploadPath);
		 * System.out.println("savedPath : " + savedPath);
		 * System.out.println("savedName : " + savedName); File target = new
		 * File(savedPath, savedName); prog.setUploadLocation(savedName);
		 * FileCopyUtils.copy(file.getBytes(), target);
		 * System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		 * System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		 */

		
		// return "program/list.tiles";
	}

	/*
	 * @GetMapping("/tab") public String tab() { return "program/tab.tiles"; }
	 * 
	 * @GetMapping("/tab1") public String tab1() { return "program/tab.tiles"; }
	 * 
	 * @GetMapping("/tab2") public String tab2() { return "program/tab2.tiles"; }
	 * 
	 * @GetMapping("/tab3") public String tab3() { return "program/tab3.tiles"; }
	 */

	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("cri: " + cri);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		List<ProgVO> programs = progService.getListWithPaging(cri);
		model.addAttribute("programs", programs);

		int total = progService.getTotalCount(cri);
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageDTO);

		// 테스트(전체조회, 전체게시물수, pageDTO)
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("getList: " + programs);
		System.out.println("getTotalCount: " + total);
		System.out.println("pageMaker: " + pageDTO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

		return "program/list.tiles";
	}

	@GetMapping("/info")
	public String info(@RequestParam("progSeq") int progSeq, @ModelAttribute("cri") Criteria cri, Model model) {
		
		ProgVO program = progService.get(progSeq);
		model.addAttribute("program", program);
		
		// 전체 후기 개수 불러오기
		int reviewCount = reviewService.count(program.getProgSeq());
		model.addAttribute("reviewCount",reviewCount);
		
		// 후기가 있다면, 대표 후기 읽어오기
		if(reviewCount > 0) {
		ReviewVO review = new ReviewVO();
		review.setProgram_progSeq(progSeq);
		review = reviewService.getFirstOne(review);
		String reviewName = reviewService.readUserName(review.getUser_userNumber());
		model.addAttribute("reviewOne",review);
		model.addAttribute("reviewName",reviewName);
		}
		
		// test
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("program: " + program);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

		return "program/info.tiles";
	}

	/*
	 * @GetMapping("/jstest") public String jstest() { return "program/jstest"; }
	 */
}
