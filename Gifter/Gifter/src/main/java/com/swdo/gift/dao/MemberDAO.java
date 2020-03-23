package com.swdo.gift.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.gift.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	
	public int memberInsert(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.memberInsert(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	public int memberLogin(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.memberLogin(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int naverMemberInsert(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.naverMemberInsert(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
		
	}
	
	
	
}
