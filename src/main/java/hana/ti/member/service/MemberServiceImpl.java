package hana.ti.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hana.ti.member.dao.MemberDAO;
import hana.ti.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	/**
	 * 로그인
	 * */
	@Override
	public MemberVO login(MemberVO member) {
		
		return memberDAO.login(member);
	}
	
	/**
	 * 회원가입
	 * */
	@Override
	public void signupMem(MemberVO member) {
		memberDAO.signUp(member);
	}
	
	/**
	 * 아이디 중복확인
	 * */
	@Override
	public int idChk(MemberVO member) {
		int result = memberDAO.idChk(member);
		return result;
	}
}
