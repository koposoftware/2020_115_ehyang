package hana.ti.account.service;

import java.util.List;

import hana.ti.account.vo.AccountVO;

public interface AccountService {

	/**
	 * 내 전체 통합계좌목록 보여주기
	 * */
	List<AccountVO> selectAllAccount(String id);
	
	/**
	 * 자동이체
	 * */
	public void transfer(AccountVO account);
	
	/**
	 * 증권계좌개설
	 * */
	public void create(AccountVO account);
		
	
	/**
	 * 증권계좌조회
	 * */
	List<AccountVO> selectSAllAccount(String id);

	
	/**
	 * 주금통 계좌 조회
	 * */
	List<AccountVO> regA(String id);
}
