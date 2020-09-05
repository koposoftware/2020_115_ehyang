package hana.ti.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hana.ti.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 로그인
	 * */
	
	@Override
	public MemberVO login(MemberVO member) {
		
		MemberVO loginVO = sqlSession.selectOne("member.dao.MemberDAO.login", member);
		
		return loginVO;
	}

	/**
	 * 회원가입
	 * */
	@Override
	public MemberVO signUp(MemberVO member) {
		
		sqlSession.insert("member.dao.MemberDAO.signUp", member);
		
		return null;
	}
	
	/**
	 * 아이디 중복확인
	 * */
	@Override
	public int idChk(MemberVO member) {
		int result = sqlSession.selectOne("memberMapper2.idChk", member);
		return result;
	}
}
