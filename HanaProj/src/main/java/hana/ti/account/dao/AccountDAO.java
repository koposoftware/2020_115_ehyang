package hana.ti.account.dao;

import java.util.List;

import hana.ti.account.vo.AccountVO;

public interface AccountDAO {

	/**
	 * 통합계좌조회
	 * */
	public List<AccountVO> selectAll(String id);
	
	/**
	 * 자동이체 보내기
	 * */
	public void send(AccountVO account);
	
	/**
	 * 자동이체 받기
	 * */
	public void receive(AccountVO account);
	
	/**
	 * 증권계좌개설
	 * */
	public void create(AccountVO account);
	
	/**
	 * 증권계좌조회
	 * */
	public List<AccountVO> selectSAll(String id);
	
	/**
	 * 주긍통서비스 등록한 통합계좌조회
	 * */
	public List<AccountVO> regA(String id);
}
