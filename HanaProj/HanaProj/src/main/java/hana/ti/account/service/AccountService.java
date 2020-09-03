package hana.ti.account.service;

import java.util.List;

import hana.ti.account.vo.AccountVO;

public interface AccountService {

	/**
	 * 주금통 서비스 이용 X 통합계좌조회
	 * */
	List<AccountVO> selectAllAccount(String id);

	
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
