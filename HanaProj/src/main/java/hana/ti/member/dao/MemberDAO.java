package hana.ti.member.dao;

import hana.ti.member.vo.MemberVO;

public interface MemberDAO {

	// 로그인
	MemberVO login(MemberVO member);
	
	// 회원가입
	MemberVO signUp(MemberVO member);
	
	// 아이디 중복확인
	public int idChk(MemberVO member);
	
}
