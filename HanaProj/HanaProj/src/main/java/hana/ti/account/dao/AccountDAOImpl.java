package hana.ti.account.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hana.ti.account.vo.AccountVO;

@Repository
public class AccountDAOImpl implements AccountDAO {


	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 주금통 서비스 이용 X 통합계좌조회
	 * */
	@Override
	public List<AccountVO> selectAll(String id) {
		List<AccountVO> accountList = sqlSession.selectList("account.dao.AccountDAO.selectAll", id);
		return accountList;
	}
	
	/**
	 * 증권계좌개설
	 * */
	@Override
	public void create(AccountVO account) {
		sqlSession.insert("account.dao.AccountDAO.create", account);
	}
	
	/**
	 * 증권계좌조회
	 * */
	@Override
	public List<AccountVO> selectSAll(String id) {
		List<AccountVO> SAccountList = sqlSession.selectList("account.dao.AccountDAO.selectSAll", id);
		return SAccountList;
	}
	
	/**
	 * 주금통 서비스 이용 O 통합계좌조회
	 * */
	@Override
	public List<AccountVO> regA(String id) {
		List<AccountVO> regList = sqlSession.selectList("account.dao.AccountDAO.regA", id);
		return regList;
	}
}
