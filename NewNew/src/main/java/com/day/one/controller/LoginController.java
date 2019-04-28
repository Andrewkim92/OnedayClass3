package com.day.one.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.day.one.dao.UserDao;
import com.day.one.vo.UserVO;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserDao loginService;

	@Autowired
	private FacebookConnectionFactory connectionFactory;

	@Autowired
	private OAuth2Parameters oAuth2Parameters;

	@RequestMapping("/register")
	public String register(Model model,HttpSession session) {

		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
		String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);

		model.addAttribute("facebook_url", facebook_url);
		System.out.println("/facebook" + facebook_url);

		return "login/register.tiles";
	}

	@RequestMapping(value = "/facebookSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String facebookSignInCallback(@RequestParam String code,HttpSession session) throws Exception {

		UserVO vo =new UserVO();
		
		try {
			String redirectUri = oAuth2Parameters.getRedirectUri();
			System.out.println("Redirect URI : " + redirectUri);
			System.out.println("Code : " + code);

			OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
			AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
			String accessToken = accessGrant.getAccessToken();
			System.out.println("AccessToken: " + accessToken);
			Long expireTime = accessGrant.getExpireTime();

			if (expireTime != null && expireTime < System.currentTimeMillis()) {
				accessToken = accessGrant.getRefreshToken();
				System.out.println("accessToken is expired. refresh token = {} " + accessToken);
			}
			

			Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
			Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
//			UserOperations userOperations = facebook.userOperations();
			
			try

			{
				String[] fields = { "id", "email", "name","birthday" };
//				connection.fetchUserProfile();
				User userProfile = facebook.fetchObject("me", User.class, fields);
				System.out.println("유저이메일 : " + userProfile.getEmail());
				System.out.println("유저 id : " + userProfile.getId());
				System.out.println("유저 name : " + userProfile.getName());
				System.out.println("유저 user_birthday : " + userProfile.getBirthday());
				
				vo.setId(userProfile.getEmail());
				vo.setName(userProfile.getName());
				vo.setPassword("facebookUser");
				vo.setUserGrade(4);
				
				loginService.insert(vo);
				
				session.setAttribute("userVO", vo);
			} catch (MissingAuthorizationException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		return "redirect:/";

	}

	@PostMapping("/doRegister")
	public String doRegister(UserVO vo, HttpServletResponse response, Model model) {

		 OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
		 String facebook_url =
		 oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,
		 oAuth2Parameters);
		
		 model.addAttribute("facebook_url", facebook_url);
		 System.out.println("/facebook" + facebook_url);

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

		// model.addAttribute("userVO", vo); // model에 {userVO : vo} 저장
		session.setAttribute("userVO", vo);
		System.out.println("loginSucceed..");
		return "redirect:/";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception { // 로그아웃
		Object obj = session.getAttribute("userVO");

		if (obj != null) {
			UserVO vo = (UserVO) obj;
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
