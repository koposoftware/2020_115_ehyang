package hana.ti.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hana.ti.account.dao.AccountDAO;
import hana.ti.account.vo.AccountVO;
import hana.ti.autotransfer.dao.AutotransferDAO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	   private AccountDAO accountDAO;
	@Autowired
		private AutotransferDAO autotransferDAO;
	/**
	 * 통합계좌조회
	 * */
	@Override
	public List<AccountVO> selectAllAccount(String id) {
		
		List<AccountVO> accountList = accountDAO.selectAll(id);
		accountDAO.sum(id);
		return accountList;
	}
	
	/**
	 * 총자산
	 * */
	@Override
	public int sum(String id) {
		int sumTotal = accountDAO.sum(id);
		return sumTotal;
	}



	/**
	 * 주금통 서비스 이용 X 통합계좌조회
	 * */
	@Override
	public List<AccountVO> selectNotRegAccount(String id) {
		
		List<AccountVO> accountNotRegList = accountDAO.selectAllNotReg(id);
		return accountNotRegList;
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
	 * 주금통 서비스 이용 O 통합계좌조회
	 * */
	@Override
	public List<AccountVO> regA(String id) {
		List<AccountVO> regA = accountDAO.regA(id);
		return regA;
	}

	/**
	 * 주금통 해지
	 * */
	@Override
	public void unRegSP(String account_num) {
		accountDAO.unRegSP(account_num);
		autotransferDAO.resSPDel(account_num);
	}
}