package com.day.one.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.day.one.dao.UserDao;
import com.day.one.service.LoginService;
import com.day.one.vo.UserVO;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserDao loginService;

	@RequestMapping("/register")
	public String register() {

		return "login/register.tiles";
	}

	@PostMapping("/doRegister")
	public String doRegister(UserVO vo) {

		System.out.println(vo.getId());
		System.out.println(vo.getPassword());
		loginService.insert(vo);

		return "redirect:/";
	}

	@RequestMapping(value = "/loginGet", method = RequestMethod.GET)
	public String loginGet(HttpServletRequest request) throws Exception { // 로그인창
		HttpSession session = request.getSession();
		if (request.getRequestURI() != null && request.getHeader("referer") != null) { // 바로 로그인 URI 접근시 null값 방지
			if (session.getAttribute("temp") != null) // auth인터셉터 거칠때는 이전 페이지 저장 X
				session.removeAttribute("temp");
			else if (!(request.getRequestURI().equals("/login/loginGet")
					&& request.getHeader("referer").equals("http://localhost/login/loginGet"))) // 로그인창 여러번 클릭 할때는 저장하지
																								// 않음
				session.setAttribute("dest", request.getHeader("referer")); // 이전 페이지 정보 저장
		}

		return "login/login.tiles";
	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPost(UserVO dto, Model model, HttpSession session) throws Exception { // 로그인

		UserVO vo = null;

		// if (pwdEncoder.matches(dto.getUserPwd(), userService.getPwd(dto))) // DB
		// 비밀번호와 로그인 비밀번호 비교
		if (loginService.checkIDPwd(dto) > 0) {
			vo = loginService.login(dto); // vo에 userNo, userEmail, UserNick, userAuth 저장
		} else { // 로그인 실패시
			model.addAttribute("loginFail", true);
			System.out.println("loginFail..");
			return "login/login.tiles";
		}

//		model.addAttribute("userVO", vo); // model에 {userVO : vo} 저장
		session.setAttribute("userVO", vo);
		System.out.println("loginSucceed..");
		return "redirect:/";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception { // 로그아웃
		Object obj = session.getAttribute("login");

		if (obj != null) {
			UserVO vo = (UserVO) obj;
			session.removeAttribute("login"); // 세션 제거
			session.invalidate();
		}
		return "/login/logout";
	}

	@RequestMapping("/findPassword")
	public String findPassword() {

		return "login/findPassword.tiles";
	}
}
