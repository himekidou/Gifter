package com.swdo.gift.dao;

import com.swdo.gift.vo.Member;

public interface MemberMapper {

	public int memberInsert(Member member);
	
	public int memberLogin(Member member);
	
	public int GetKey(String member_id, String key);//유저 인증키 생성 메서드
	
	public int alter_userKey(String member_id, String key); //유저 인증키 Y로 바꿔주는 메서드

	public int alter_userKey_service(String member_id, String key); // 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)

	public int socialMemberInsert(Member member); //소셜 로그인 멤버 추가
	
	public int socialMemberFind(String member_email);
	
	public int nonMemberCheck(String member_id); //비회원 아이디 중복 체크용
	
}

