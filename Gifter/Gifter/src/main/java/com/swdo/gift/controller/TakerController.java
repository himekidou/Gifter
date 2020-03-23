package com.swdo.gift.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/taker")
public class TakerController {

	private static final Logger logger = LoggerFactory.getLogger(TakerController.class);
	
	@RequestMapping(value="search", method= {RequestMethod.GET, RequestMethod.POST})
	public String search(String taker_insta, Model model, HttpSession session) {
		
		//taker 테이블에 회원 아이디와 검색한 인스타그램 아이디 보여주기
		String member_id = (String) session.getAttribute("member_id");
		logger.info("회원의 ID : {}", member_id);
		logger.info("검색한 인스타그램 ID : {}", taker_insta);
		
		//해당하는 인스타그램의 회원이 있는지를 확인하고 있으면 
		//해당 인스타그램 회원의 카테고리별 10개를 찾을 수 있게 된다.
		//해당하는 회원이 없다면 없다는 것을 보여줘야 한다.
		
		//카테고리별 10개를 보여주도록 정보 가져오기
		
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("taker_insta", taker_insta);
		
		return "taker/search";
		
	}
	
	
	
}
