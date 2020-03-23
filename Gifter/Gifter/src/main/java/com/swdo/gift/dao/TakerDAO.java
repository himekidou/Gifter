package com.swdo.gift.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TakerDAO {

	@Autowired
	private SqlSession session;
}
