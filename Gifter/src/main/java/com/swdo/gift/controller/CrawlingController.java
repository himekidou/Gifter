package com.swdo.gift.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swdo.gift.util.PageNavigator;
import com.swdo.gift.util.SeleniumCrawling;

@Controller
@RequestMapping(value="/category")
public class CrawlingController {
	
	private static final Logger logger = LoggerFactory.getLogger(CrawlingController.class);
	
	private final int countPerPage = 5;
	private final int pagePerGroup = 5;
    
    @RequestMapping(value = "/viewCategory", method = RequestMethod.GET)
	public String selenium2(Model model, HttpSession session
			, @RequestParam(value="currentPage", defaultValue="1") int currentPage) throws Exception {
		
    	SeleniumCrawling selCrawl = new SeleniumCrawling();
		HashMap<String, Object> map = selCrawl.crawl();
		
		// 크롤링한 값 가져옴
		ArrayList<String> srcs = (ArrayList<String>) map.get("srcs");
		Elements title = (Elements) map.get("title");
		String[] prices = (String[]) map.get("prices");
		
		// jsp에서 사용하기 위해 모델에 저장
		model.addAttribute("srcs", srcs);
		model.addAttribute("prices", prices);
		model.addAttribute("title", title);

		// 타 컨트롤러에서 사용하기 위해 섹션에 저장 
		session.setAttribute("srcs", srcs);
		session.setAttribute("prices", prices);
		session.setAttribute("title", title);
		
		// 페이징처리
		int totalCount = srcs.size();
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalCount);
		
		model.addAttribute("navi", navi);

		return "/category/viewCategory";
	}
    
    @RequestMapping(value = "selePageMove", method = RequestMethod.GET)
    public String selenium3(HttpSession session, @RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
    	
    	// 세션에서 전체 크롤링한 값 꺼냄
    	ArrayList<String> srcs = (ArrayList<String>) session.getAttribute("srcs");
    	Elements title = (Elements) session.getAttribute("title");
    	String[] prices = (String[]) session.getAttribute("prices");
    	
    	// 전체 크롤링값 = 페이징에 필요
    	int totalCount = srcs.size();
    	
    	// 페이징
    	PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalCount);
    	
    	// jsp에서 사용하기 위해 모델에 저장
    	model.addAttribute("navi", navi);
    	model.addAttribute("srcs", srcs);
		model.addAttribute("title", title);
		model.addAttribute("prices", prices);
    	
    	return "/category/viewCategory";
    }
}