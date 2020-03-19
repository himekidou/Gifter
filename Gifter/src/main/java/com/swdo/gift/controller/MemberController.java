package com.swdo.gift.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swdo.gift.dao.MemberDAO;
import com.swdo.gift.util.NaverLoginBO;
import com.swdo.gift.util.UserMailSendService;
import com.swdo.gift.vo.Member;


@Controller
@RequestMapping(value="/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

		
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private UserMailSendService mailsender;

	//회원가입 폼 이동
	@RequestMapping(value="signupForm", method=RequestMethod.GET)
	public String signupForm() {
		logger.info("회원가입 페이지 이동");
		return "member/signupForm";
	}
		
	//회원가입
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public String signup(Member member, Model model, HttpServletRequest request) {
		logger.info("회원가입 ");
	
		//회원가입 메서드
		int cnt = dao.memberInsert(member);
		
		logger.info(Integer.toString(cnt));
		
		mailsender.mailSendWithUserKey(member.getMember_email(), member.getMember_id(), request);
			
		return "redirect:/member/beforeReg";
	}
	
	//callback
	@RequestMapping(value="callback", method=RequestMethod.GET)
	public String callback(HttpSession session) {
		logger.info("콜백");	
			
		//네이버로 로그인한 사람의 닉네임(member_id)과 이메일(member_email)을 가져온다
		//닉네임(member_id)을 session에 넣는다
		//메인으로 돌아간다.	
		
		return "redirect:/";
	}
	
	
	
	//이메일 인증 시키기
	@RequestMapping(value="beforeReg", method=RequestMethod.GET)
	public String beforeReg() {	
		logger.info("이메일 인증 요구");
		return "member/beforeReg";
	}
	
	//e-mail 인증 컨트롤러
	@RequestMapping(value="key_alter", method=RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("member_id") String member_id
			,@RequestParam("member_key") String member_key ) {
		
		mailsender.alter_userKey_service(member_id, member_key);
		
		return "member/regSuccess";
	}
	
	//로그인 폼 이동
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인 폼 이동");
		return "member/loginForm";		
	}
		
	//로그인 하기
	@RequestMapping(value="login", method= RequestMethod.GET)
	public String login(Member member, HttpSession session, Model model) {
		logger.info("로그인 하기");
		int result = dao.memberLogin(member);
		if(result != 1) {
			logger.info("로그인 실패");
			return "redirect:/member/loginForm";
		}
		logger.info("로그인 성공");
		session.setAttribute("member_id", member.getMember_id());
		return "redirect:/";
	}
	
	//네이버 로그인
	@RequestMapping(value="naverLogin", method = RequestMethod.GET)
	public String naverLogin(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		logger.info("네이버: " + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);


		return "member/naverLogin";
	}
	
		
	//로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그아웃 하기");
		session.removeAttribute("member_id");
		return "redirect:/";		
	}	
	
	
	
	
}
