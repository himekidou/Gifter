package com.swdo.gift.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.jsoup.nodes.Element;
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
    	
    	logger.info("페이징 : "+currentPage);
    	
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
    
    @RequestMapping(value = "/recommendList", method = RequestMethod.GET)
   	public String recommendList(Model model, HttpSession session) throws Exception {
   		
    	logger.info("추천페이지 컨트롤러");
    	
    	// 세션에서 전체 크롤링한 값 꺼냄
    	ArrayList<String> srcs = (ArrayList<String>) session.getAttribute("srcs");
    	Elements title = (Elements) session.getAttribute("title");
    	String[] prices = (String[]) session.getAttribute("prices");
    	
    	// 추천상품으로 랜덤으로 3개 가져옴
    	Random random = new Random();
    	int[] num = new int[3];
    	for (int i = 0; i < 3; i++) {
    		num[i] = random.nextInt(srcs.size());
    	}
    	// 상품 이미지 3개
    	String recomSrc1 = srcs.get(num[0]);
 		String recomSrc2 = srcs.get(num[1]);
    	String recomSrc3 = srcs.get(num[2]);
    	// 타이틀 및 하이퍼링크 3개		
    	Element recomTit1 = title.get(num[0]);
    	Element recomTit2 = title.get(num[1]);
    	Element recomTit3 = title.get(num[2]);
    	// 해당 가격 3개
    	String recompri1 = prices[num[0]].toString();
    	String recompri2 = prices[num[1]].toString();
    	String recompri3 = prices[num[2]].toString();
    			
    	// 모델에 담아서 jsp에 보냄
    	model.addAttribute("recomSrc1", recomSrc1);
		model.addAttribute("recomSrc2", recomSrc2);
		model.addAttribute("recomSrc3", recomSrc3);
		
		model.addAttribute("recomTit1", recomTit1);
		model.addAttribute("recomTit2", recomTit2);
		model.addAttribute("recomTit3", recomTit3);
		
		model.addAttribute("recompri1", recompri1);
		model.addAttribute("recompri2", recompri2);
		model.addAttribute("recompri3", recompri3);
    	
   		return "/category/recommendList";
   	}
    
    
}