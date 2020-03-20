package com.swdo.gift.controller;



import java.io.IOException;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.swdo.gift.dao.MemberDAO;
import com.swdo.gift.util.AuthInfo;
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

	/* GoogleLogin */
	@Inject
    private AuthInfo authInfo;
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;



		
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
		
		//회원가입 발송 이메일(인증키 발송)
		mailsender.mailSendWithUserKey(member.getMember_email(), member.getMember_id(), request);
			
		return "redirect:/member/beforeReg";
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
	
	/*
	//로그인 폼 이동
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginForm() {
		logger.info("로그인 폼 이동");
		return "member/loginForm";		
	}
	*/
	
	
	//로그인 하기
	@RequestMapping(value="login", method= RequestMethod.POST)
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
	
	
	//로그인 폼 이동
	@RequestMapping(value="loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(Model model, HttpSession session) {
		logger.info("로그인 폼");
		
		//1)네이버 로그인 
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		 String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		 
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		
		logger.info("네이버: " + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
			
		//2)구글 로그인
		
		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		logger.info("구글: " + url);

		model.addAttribute("google_url", url);

		return "member/loginForm";
	}
	
	

	//네이버 콜백
	@RequestMapping(value="callback", method={ RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) 
			throws IOException, ParseException{
		
		logger.info("여기는 콜백");	
				
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		logger.info("아이디는 {}",nickname);
		
		//response의 nickname값 파싱
		String email = (String)response_obj.get("email");
		logger.info("이메일은 {}", email);
		
		//4.db에 넣기
			
		//랜덤 비밀번호 생성
		String tempPassword = ""; 

		for(int i=0; i<10; i++) { 
			int rndVal = (int)(Math.random() * 62); 
			if(rndVal < 10) { tempPassword += rndVal; } 
			else if(rndVal > 35) { tempPassword += (char)(rndVal + 61); } 
			else { tempPassword += (char)(rndVal + 55); 
			} 
			
		} 
		System.out.println("tempPassword : " + tempPassword);
		
		Member member = new Member() ;
		member.setMember_id("na-" + nickname);
		member.setMember_pw(tempPassword);
		member.setMember_email(email);
		member.setMember_key("Y");
		
		int cnt = dao.naverMemberInsert(member);
		logger.info(Integer.toString(cnt));	
		if(cnt == 0) {
			logger.info("회원가입 실패");
		}
		else {
			logger.info("회원가입 성공");
		}
			
		//5.파싱 닉네임 세션으로 저장
		session.setAttribute("member_id",nickname); //세션 생성
		//session.setAttribute("member_email",email); //세션 생성
		//model.addAttribute("result", apiResult);
		
		return "redirect:/member/loginForm";	
	}
	
	// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, HttpSession session, HttpServletRequest request) throws IOException {
		logger.info("여기는 구글 콜백");

        String code = request.getParameter("code");
        System.out.println(code);
        
        //RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
        RestTemplate restTemplate = new RestTemplate();
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code", code);
        parameters.add("client_id", authInfo.getClientId());
        parameters.add("client_secret", authInfo.getClientSecret());
        parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
        parameters.add("grant_type", "authorization_code");
 
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
        ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
        Map<String, Object> responseMap = responseEntity.getBody();
 
        // id_token 라는 키에 사용자가 정보가 존재한다.
        // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다.
        // 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
        //Base 64로 인코딩 되어 있으므로 디코딩한다.
 
        String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
        Base64 base64 = new Base64(true);
        String body = new String(base64.decode(tokens[1]));
        
        System.out.println(tokens.length);
        System.out.println(new String(Base64.decodeBase64(tokens[0]), "utf-8"));
        System.out.println(new String(Base64.decodeBase64(tokens[1]), "utf-8"));
 
        //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> result = mapper.readValue(body, Map.class);
        System.out.println(result.get(""));
		//session.setAttribute(name, value);
        
        
		return "redirect:/member/loginForm";
	}
	

	//로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그아웃 하기");
		session.removeAttribute("member_id");
		return "redirect:/";		
	}	
	
	
	
	
}
