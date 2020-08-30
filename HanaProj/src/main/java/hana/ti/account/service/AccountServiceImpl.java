package hana.ti.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hana.ti.account.dao.AccountDAO;
import hana.ti.account.vo.AccountVO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	   private AccountDAO accountDAO;
	
	/**
	 * 통합계좌조회
	 * */
	@Override
	public List<AccountVO> selectAllAccount(String id) {
		
		List<AccountVO> accountList = accountDAO.selectAll(id);
		return accountList;
	}

	/**
	 * 자동이체
	 * */
	@Override
	public void transfer(AccountVO account) {
		accountDAO.send(account);
		accountDAO.receive(account);
	}

	/**
	 * 증권계좌개설
	 * */
	@Override
	public void create(AccountVO account) {
		accountDAO.create(account);
	}
	
	
	/**
	 * 증권계좌조회
	 * */
	@Override
	public List<AccountVO> selectSAllAccount(String id) {
		List<AccountVO> SAccountList = accountDAO.selectSAll(id);
		return SAccountList;
	}

	
	/**
	 * 주금통 계좌 조회
	 * */
	@Override
	public List<AccountVO> regA(String id) {
		List<AccountVO> regA = accountDAO.regA(id);
		return regA;
	}
}