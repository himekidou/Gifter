package com.swdo.gift.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.gift.dao.CategoryDAO;

@Controller
@RequestMapping(value="/category")
public class CategoryController {

	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	private CategoryDAO dao;
	
	@RequestMapping(value="bestForm", method=RequestMethod.GET)
	public String bestForm() {
		logger.info("베스트 고르는 창 이동");
		return "category/bestForm";
	}
	
	
	@RequestMapping(value="categoryList", method=RequestMethod.POST)
	public String categoryList(int age, int age_range, int gender) {
		logger.info("카테고리 리스트");
		logger.info("나이 : {}", age);		//나이는 10, 20, 30, 40을 나눔
		logger.info("나이대 : {}", age_range); //초반은 0이고 후반은 5이다
		logger.info("성별 : {}", gender);	//남자는 0이고 여자는 1이다.
		
		
		
		return "";
	}
	
	
	
	
}
