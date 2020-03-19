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

	//�쉶�썝媛��엯 �뤌 �씠�룞
	@RequestMapping(value="signupForm", method=RequestMethod.GET)
	public String signupForm() {
		logger.info("�쉶�썝媛��엯 �럹�씠吏� �씠�룞");
		return "member/signupForm";
	}
		
	//�쉶�썝媛��엯
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public String signup(Member member, Model model, HttpServletRequest request) {
		logger.info("�쉶�썝媛��엯 ");
	
		//�쉶�썝媛��엯 硫붿꽌�뱶
		int cnt = dao.memberInsert(member);
		
		logger.info(Integer.toString(cnt));
		
		mailsender.mailSendWithUserKey(member.getMember_email(), member.getMember_id(), request);
			
		return "redirect:/member/beforeReg";
	}
	
	//callback
	@RequestMapping(value="callback", method=RequestMethod.GET)
	public String callback(HttpSession session) {
		logger.info("肄쒕갚");	
			
		//�꽕�씠踰꾨줈 濡쒓렇�씤�븳 �궗�엺�쓽 �땳�꽕�엫(member_id)怨� �씠硫붿씪(member_email)�쓣 媛��졇�삩�떎
		//�땳�꽕�엫(member_id)�쓣 session�뿉 �꽔�뒗�떎
		//硫붿씤�쑝濡� �룎�븘媛꾨떎.	
		
		return "redirect:/";
	}
	
	
	
	//�씠硫붿씪 �씤利� �떆�궎湲�
	@RequestMapping(value="beforeReg", method=RequestMethod.GET)
	public String beforeReg() {	
		logger.info("�씠硫붿씪 �씤利� �슂援�");
		return "member/beforeReg";
	}
	
	//e-mail �씤利� 而⑦듃濡ㅻ윭
	@RequestMapping(value="key_alter", method=RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("member_id") String member_id
			,@RequestParam("member_key") String member_key ) {
		
		mailsender.alter_userKey_service(member_id, member_key);
		
		return "member/regSuccess";
	}
	
	//濡쒓렇�씤 �뤌 �씠�룞
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginForm() {
		logger.info("濡쒓렇�씤 �뤌 �씠�룞");
		return "member/loginForm";		
	}
		
	//濡쒓렇�씤 �븯湲�
	@RequestMapping(value="login", method= RequestMethod.GET)
	public String login(Member member, HttpSession session, Model model) {
		logger.info("濡쒓렇�씤 �븯湲�");
		int result = dao.memberLogin(member);
		if(result != 1) {
			logger.info("濡쒓렇�씤 �떎�뙣");
			return "redirect:/member/loginForm";
		}
		logger.info("濡쒓렇�씤 �꽦怨�");
		session.setAttribute("member_id", member.getMember_id());
		return "redirect:/";
	}
	
	//�꽕�씠踰� 濡쒓렇�씤
	@RequestMapping(value="naverLogin", method = RequestMethod.GET)
	public String naverLogin(Model model, HttpSession session) {
		
		/* �꽕�씠踰꾩븘�씠�뵒濡� �씤利� URL�쓣 �깮�꽦�븯湲� �쐞�븯�뿬 naverLoginBO�겢�옒�뒪�쓽 getAuthorizationUrl硫붿냼�뱶 �샇異� */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		logger.info("�꽕�씠踰�: " + naverAuthUrl);
		//�꽕�씠踰�
		model.addAttribute("url", naverAuthUrl);


		return "member/naverLogin";
	}
	
		
	//濡쒓렇�븘�썐
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("濡쒓렇�븘�썐 �븯湲�");
		session.removeAttribute("member_id");
		return "redirect:/";		
	}	
	
	
	
	
}
