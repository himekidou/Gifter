package com.swdo.gift.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.swdo.gift.vo.Category;

public interface CategoryMapper {

	//카테고리 리스트
	public ArrayList<Category> categoryList(Category category, RowBounds rb);
	
	//글 개수
	public int listCount();
}
