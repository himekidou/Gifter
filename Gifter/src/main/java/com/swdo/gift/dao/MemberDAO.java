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
	
	public int socialMemberInsert(Member member) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.socialMemberInsert(member);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;		
	}
	
	
	public int socialMemberFind(String member_email) {
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.socialMemberFind(member_email);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;	
		
	}
	
	public int nonMemberCheck(String member_id) {	
		int cnt = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.nonMemberCheck(member_id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;	
	}
	
	
	
}
