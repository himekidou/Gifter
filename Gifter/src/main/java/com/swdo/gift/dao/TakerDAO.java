package com.swdo.gift.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.gift.vo.Taker;

@Repository
public class TakerDAO {

	@Autowired
	private SqlSession session;
	
	
	public int takerInsert(Taker taker) {
		int cnt = 0;
		try {
			TakerMapper mapper = session.getMapper(TakerMapper.class);
			cnt = mapper.takerInsert(taker);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
}
