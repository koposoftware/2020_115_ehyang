package hana.ti.member.service;

import hana.ti.member.vo.MemberVO;

public interface MemberService {

	/**
	 * 로그인
	 * */
	MemberVO login(MemberVO member);
	
	/**
	 * 회원가입
	 * */
	public void signupMem(MemberVO member);
	
	/**
	 * 아이디 중복확인
	 * */
	public int idChk(MemberVO member);
}
