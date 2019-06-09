package com.day.one.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.day.one.dao.UserDao;
import com.day.one.vo.UserVO;
import com.fasterxml.jackson.databind.JsonNode;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserDao loginService;

	@Autowired
	private KakaoController kakaoLogin;

	@Inject
	PasswordEncoder passwordEncoder;

	// @Autowired
	// private FacebookConnectionFactory connectionFactory;

	// @Autowired
	// private OAuth2Parameters oAuth2Parameters;

	@RequestMapping(value = "/oauth", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
		JsonNode userInfo = kakaoLogin.getKakaoUserInfo(code);

		System.out.println(userInfo);

		String id = userInfo.get("id").toString();
		// String email = userInfo.get("kaccount_email").toString();
		String image = userInfo.get("properties").get("profile_image").toString().replaceAll("\"", "");
		String nickname = userInfo.get("properties").get("nickname").toString().replace("\"", "");

		UserVO vo = new UserVO();

		vo.setId(id);
		vo.setName(nickname);
		vo.setUserGrade(5);
		vo.setImgPath(image);

		// 1. 회원가입 되있는지?
		if (loginService.checkID(vo) > 0) { // 2. 회원가입 o -> 기존 아이디 불러와 로그인

			vo = loginService.getVObyId(vo);
		} else { // 3. 회원가입 x -> kakao 정보로 회원가입
			loginService.insert(vo);
		}

		session.setAttribute("userVO", vo);

		return "redirect:/";
	}

	@RequestMapping("/register")
	public String register(Model model, HttpSession session) {

		// OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
		// String facebook_url =
		// oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,
		// oAuth2Parameters);
		//
		// model.addAttribute("facebook_url", facebook_url);
		// System.out.println("/facebook" + facebook_url);

		String kakaoUrl = kakaoLogin.getAuthorizationUrl(session);
		System.out.println(kakaoUrl);
		model.addAttribute("kakao_url", kakaoUrl);

		return "login/register.tiles";
	}

	@PostMapping("/doRegister")
	public ModelAndView doRegister(UserVO vo, HttpServletResponse response, Model model,HttpSession session) throws IOException {

		// OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
		// String facebook_url =
		// oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,
		// oAuth2Parameters);
		//
		// model.addAttribute("facebook_url", facebook_url);
		// System.out.println("/facebook" + facebook_url);

		String encPassword = passwordEncoder.encode(vo.getPassword());

		vo.setPassword(encPassword);

		System.out.println(encPassword);
		System.out.println(vo.getId());
		System.out.println(vo.getPassword());
		
		if(loginService.getVObyId(vo)!=null) { // 이미 있는 ID 존재
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 존재하는 ID입니다. '); location.href='http://localhost:8080/login/register';</script>");
			out.flush();
			return new ModelAndView("/");

		}else {
			loginService.insert(vo);
			
			session.setAttribute("userVO", vo);
			
			return new ModelAndView("redirect:/");
		}
		
	}
	
	@RequestMapping(value = "/facebookSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String facebookSignInCallback(@RequestParam String code, HttpSession session) throws Exception {

		UserVO vo = new UserVO();

		/*
		 * try { String redirectUri = oAuth2Parameters.getRedirectUri();
		 * System.out.println("Redirect URI : " + redirectUri);
		 * System.out.println("Code : " + code);
		 * 
		 * OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
		 * AccessGrant accessGrant = oauthOperations.exchangeForAccess(code,
		 * redirectUri, null); String accessToken = accessGrant.getAccessToken();
		 * System.out.println("AccessToken: " + accessToken); Long expireTime =
		 * accessGrant.getExpireTime();
		 * 
		 * if (expireTime != null && expireTime < System.currentTimeMillis()) {
		 * accessToken = accessGrant.getRefreshToken();
		 * System.out.println("accessToken is expired. refresh token = {} " +
		 * accessToken); } ;
		 * 
		 * Connection<Facebook> connection =
		 * connectionFactory.createConnection(accessGrant); Facebook facebook =
		 * connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
		 * UserOperations userOperations = facebook.userOperations();
		 * 
		 * try
		 * 
		 * { String[] fields = { "id", "email", "name","birthday" };
		 * connection.fetchUserProfile(); User userProfile = facebook.fetchObject("me",
		 * User.class, fields); System.out.println("유저이메일 : " + userProfile.getEmail());
		 * System.out.println("유저 id : " + userProfile.getId());
		 * System.out.println("유저 name : " + userProfile.getName());
		 * System.out.println("유저 user_birthday : " + userProfile.getBirthday());
		 * 
		 * vo.setId(userProfile.getEmail()); vo.setName(userProfile.getName());
		 * vo.setPassword("facebookUser"); vo.setUserGrade(4);
		 * 
		 * loginService.insert(vo);
		 * 
		 * 
		 * session.setAttribute("userVO", vo); } catch (MissingAuthorizationException e)
		 * { e.printStackTrace(); }
		 * 
		 * } catch (Exception e) {
		 * 
		 * e.printStackTrace();
		 * 
		 * }
		 */

		return "redirect:/";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet(HttpServletRequest request, Model model) throws Exception { // 로그인창
		HttpSession session = request.getSession();
		if (request.getRequestURI() != null && request.getHeader("referer") != null) { // 바로 로그인 URI 접근시 null값 방지
			if (session.getAttribute("temp") != null) // auth인터셉터 거칠때는 이전 페이지 저장 X
				session.removeAttribute("temp");
			else if (!(request.getRequestURI().equals("/login/loginGet")
					&& request.getHeader("referer").equals("http://localhost/login/loginGet"))) // 로그인창 여러번 클릭 할때는 저장하지
																								// 않음
				session.setAttribute("dest", request.getHeader("referer")); // 이전 페이지 정보 저장
		}

		String kakaoUrl = kakaoLogin.getAuthorizationUrl(session);
		System.out.println(kakaoUrl);
		model.addAttribute("kakao_url", kakaoUrl);

		return "login/login.tiles";
	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public ModelAndView loginPost(UserVO dto, Model model, HttpSession session,HttpServletResponse response) throws Exception { // 로그인
		
		UserVO vo = loginService.getVObyId(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (vo != null) {
			if (passwordEncoder.matches(dto.getPassword(), vo.getPassword())) {// DB
				vo = loginService.login(dto); // vo에 userNo, userEmail, UserNick, userAuth 저장
			} else {
				System.out.println("password not match");
				model.addAttribute("loginFail", true);
				System.out.println("loginFail..");
				
				out.println("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='http://localhost:8080//login/login';</script>");
				out.flush();
				return new ModelAndView("/login/login");
			}
		} else {
			System.out.println("Id is wrong..");
			out.println("<script>alert('ID가 존재하지 않습니다.'); location.href='http://localhost:8080//login/login';</script>");
			out.flush();
			return new ModelAndView("/login/login");
		}

		session.setAttribute("userVO", vo);
		System.out.println("loginSucceed..");
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception { // 로그아웃
		Object obj = session.getAttribute("userVO");

		if (obj != null) {
			// UserVO vo = (UserVO) obj;
			session.removeAttribute("userVO"); // 세션 제거
			session.invalidate();
		}
		return "redirect:/";
	}

	@RequestMapping("/findPassword")
	public String findPassword() {

		return "login/findPassword.tiles";
	}
}
